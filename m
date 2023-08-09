Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5601EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Aug 2023 03:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oG4d/I8ir4/ruptehuylR56CYQvHC70jqVbzmkpk3I=; b=NLlIzVolYTPcd3u+Nmyg0hIIf0
	N2SqMgv8Z8WY3YGMUNEdCeQHS7W6sXAaQFxXjXKbgC6mFN4RtTt3a1bykawpgsbUAI4g2cnZPF1LP
	TWJa0gP2GVssZ0O9rMlOJAlkSaPCpTQ8Y5rKhCPap5ntDlFHwSqL9X5oDxNzfIy6nuGhCfabOYvuc
	/TImix6onbaBD7vBe17udpSwE1j1dWBT783cl4b7cINSXOnBVWJV9yHDT9q5NAQI09QWortEVe1tJ
	b44D291xxYAUcHUgISfDQf9Q4UBA0cDCjm9/SzGXl+yC0ihFfbkmPseoizM4150qbl9UtI9qyg7Fc
	S44EYr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTa79-003xQt-1L;
	Wed, 09 Aug 2023 03:44:03 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTa76-003xPz-2j
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Aug 2023 03:44:02 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686f94328a4so372141b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 20:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691552638; x=1692157438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9oG4d/I8ir4/ruptehuylR56CYQvHC70jqVbzmkpk3I=;
        b=m0M9ESztIHd3k/4YAEahMQomo6yS3F+Z9cnYY9pM75iWtstE5bi9Po13NS3EXiM21r
         m4pY71hARK8luqnGo58LY6/hxXAVNtN58gy1tW5UBmG5vCJHq1FArK6iULv7VFqzRdiL
         QSgHmTtAvJANKMWjYGv0kTKGMtSpjSMVQYb40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691552638; x=1692157438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oG4d/I8ir4/ruptehuylR56CYQvHC70jqVbzmkpk3I=;
        b=GXnLs1M20hr2dxCRIq89hRg4F/mE/MVBdUDOBNJAD/6adDNcFJQTMATSFHaNUw48nz
         tq0wkT6aQHrZbTxSrcU8/6D1nPQnqQHhFXH+331U4QyYBU0wzGvkFalDhTu7M5mQjAaA
         G+QqUA3wR7UssAlV07CwGP1DwlqYKdpvmdYgMv7ItrUG5qzxcL+FQAXuu4GM7P7jmWGg
         ACfaaOZVNehCHg0LE4mGZ84ha53MK8uuIaq+KYNNZ7Saf6jf9CJBnTcvDzUvwglmHHxX
         VSFaboO3Rg/5ABKx3SqKRHm7OqnazkipZJxICRrE0VAyxG9nsRcggywKmPxCw7czfQHF
         Z+Ew==
X-Gm-Message-State: AOJu0YzNF6xMQzNt20cLJqOBOS54DMrPIE6BGQAMIeAE4UmiiuXR2LNt
	R597Nr/Eh7jHEK8uqr2n2PhWUA==
X-Google-Smtp-Source: AGHT+IFHhyziILszxrpiAnFzHo8VltBiti0umAg2qsyWqMRc7sZaS1IAqOQed/uisVP/DuAKoVJv7w==
X-Received: by 2002:a05:6a00:2347:b0:684:bb4a:b86e with SMTP id j7-20020a056a00234700b00684bb4ab86emr2217159pfj.1.1691552638606;
        Tue, 08 Aug 2023 20:43:58 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:eed6:5c4f:9687:371])
        by smtp.gmail.com with ESMTPSA id h3-20020a633843000000b00564aee22f33sm7217056pgn.14.2023.08.08.20.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 20:43:58 -0700 (PDT)
Date: Wed, 9 Aug 2023 11:43:55 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Wei Chen <harperchen1110@gmail.com>
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com, mchehab@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: vcodec: Fix potential array out-of-bounds in
 vb2ops_venc_queue_setup
Message-ID: <20230809034355.GA589411@google.com>
References: <20230328092608.523933-1-harperchen1110@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328092608.523933-1-harperchen1110@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_204401_349488_47570FBD 
X-CRM114-Status: GOOD (  18.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 28, 2023 at 09:26:08AM +0000, Wei Chen wrote:
> variable *nplanes is provided by user via system call argument. The
> possible value of q_data->fmt->num_planes is 1-3, while the value
> of *nplanes can be 1-8. The array access by index i can cause array
> out-of-bounds.
> 
> Fix this bug by checking *nplanes against the array size.

This should have a fixes tag:

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")

And also CC the stable list:

Cc: stable@vger.kernel.org

> Signed-off-by: Wei Chen <harperchen1110@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> index d65800a3b89d..1ea02f9136f6 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> @@ -821,6 +821,8 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
>  		return -EINVAL;
>  
>  	if (*nplanes) {
> +		if (*nplanes != q_data->fmt->num_planes)
> +			return -EINVAL;
>  		for (i = 0; i < *nplanes; i++)
>  			if (sizes[i] < q_data->sizeimage[i])
>  				return -EINVAL;
> -- 
> 2.25.1
> 

