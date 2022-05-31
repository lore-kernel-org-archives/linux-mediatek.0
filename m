Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 20:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20jV3Qi7FQ73MN9wEJT6kTRKjvG5JLchS2dCO4QYNHw=; b=QQyORqbMcbG2PK
	lessfGnRh4WeTcJiIZA2zF5cKd0glFk+9YqDmUp+QdDebpZPvMryqS5OpDUmi5/6NHLdANsx7lixu
	qIGKsA8ElXPuSZVN+/vh7eDEWiybpcQjIGJxykKnrq2T08QNYbIgB9hWbZVxkE7OJ95zrIeoX+Kah
	A6rfvlVLT3vw/e1gQkOHuMewRooBit6ZhYr50tYDSBzsBFPkz4lzZOLC01RMLO/zxBlItFs5+/hDj
	tJ5FzXpSVC30xcL6IaKNgYkB7gR4Km+hZ0dpHdc51HiRKHn4mzx5ZK0Fb5fGQ7tmzYoRWeTCgeohB
	BlvC+hSiJxfmU+7km0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8iE-00CbGH-6v; Tue, 31 May 2022 20:43:34 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8i1-00Cb9X-66; Tue, 31 May 2022 20:43:22 +0000
Received: by mail-io1-xd2c.google.com with SMTP id d198so15374010iof.12;
        Tue, 31 May 2022 13:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TI/uINot2gV0lsjsvp3p4xP/LTEZ58Gik5+AdIHYdjg=;
        b=WjUDqvXL2OO2piHgXTpKnWg7kXo9tMrfgtr27wgnYh5T8GyiOc6uw6wKAyJO394Zql
         fh+tPnrmnm+ECm22gO3dHdskQ1xsBGOXDIPcZlMK28PdlJ5llhwCCHdC6n+n60CQaTVW
         iw96wJJ4F85cmoal2mWrAfo0V6q8OksPYWhXPMZYzdq/EIu4xG54DN4qDRTeiYT4j4K3
         Lt8pC/MAKLTQ8RKQAG2tBmU6yObfyVkXMBCkWffZ2O6Zp6HD1JSjhfIcwdVvRMI+ijS3
         mSyz4iwbpDpK6M5kQ9YpoF9irzRtLVTpUpukpuDglcjijqmhUvcHgfLPTUmcnlaKJBBw
         GHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TI/uINot2gV0lsjsvp3p4xP/LTEZ58Gik5+AdIHYdjg=;
        b=qWjOcLzz3eU+Yw0X7so9oV0fv4SQWx5JfIhxucuUAaaBA/tuYEJneJedCcR9ygd0qT
         58Hv9YVbQdz+yJUG0IThh9v+2DeZmcj37y1p9jVtluunCLaz7wwWz/+yZa7zWshgWx9f
         t4gHQQh0RZSFLz/9LnaMNpSIFm/M/F9etw4pAtnQdYIwyUX7+9DqXIXeDWK8JAYsARCs
         Npt9oJ1BGD5pStwTQc49dB8LhlyT5MJtcCK/PKSCRhZaipuJuOZcyRpblBcboDnGnl/K
         AKEx00qQEkt/xIJRanrPYQTN46NdRgHA5UVWFPeUoW3HrmeqhLtyGM9i0lWPsggsjI9l
         zjHg==
X-Gm-Message-State: AOAM532JVBQVcndB8qr8sKC5pHWm5jvAEei0g8Ouo579gFe6FqndQIdF
	kJGB7j0qnY6aHTZeVaTQVzE=
X-Google-Smtp-Source: ABdhPJx8SX0NE5W2CPxvdPdhXAbiWnUhFsofQHgdXznAXgWnYRcojbA8I3LXi1OxTQffPNYS3M4g7A==
X-Received: by 2002:a05:6602:3299:b0:668:6cd3:60e6 with SMTP id d25-20020a056602329900b006686cd360e6mr7510796ioz.183.1654029799400;
        Tue, 31 May 2022 13:43:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:2442:6db0:bd78:a862:1b9c:aef9? ([2600:1700:2442:6db0:bd78:a862:1b9c:aef9])
        by smtp.gmail.com with ESMTPSA id q11-20020a92050b000000b002d3bb071d5bsm1010934ile.0.2022.05.31.13.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 13:43:19 -0700 (PDT)
Message-ID: <8d4b8cc3-8433-24f9-1fc5-12d71e640952@gmail.com>
Date: Tue, 31 May 2022 16:43:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] scripts: dtc: fix a false alarm for
 node_name_chars_strict
Content-Language: en-US
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 casper.li@mediatek.com, chinwen.chang@mediatek.com,
 kuan-ying.lee@mediatek.com
References: <20220531053358.19003-1-qun-wei.lin@mediatek.com>
From: Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <20220531053358.19003-1-qun-wei.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_134321_280139_92404A30 
X-CRM114-Status: GOOD (  18.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 5/31/22 01:33, Qun-Wei Lin wrote:
> The function check_node_name_chars_strict issues a false alarm when
> compiling an overlay dts.
> 
> /fragment@0/__overlay__: Character '_' not recommended in node name
> 
> This workaround will fix it by skip checking for node named __overlay__.

This is not a false alarm.

Do not special case node name "__overlay__".  This node name should never
occur in a modern overlay source file.

For details, see "Overlay Source Format" in the "Overlays" section of:
https://elinux.org/Device_Tree_Reference#Overlays

That paragraph also has a pointer to the correct format for overlay
source files, which is slides 29-34 of:
https://elinux.org/Device_Tree_Reference#Overlays

-Frank

> 
> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> ---
>  scripts/dtc/checks.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
> index 781ba1129a8e..6ef4f2cd67b9 100644
> --- a/scripts/dtc/checks.c
> +++ b/scripts/dtc/checks.c
> @@ -325,6 +325,11 @@ static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
>  {
>  	int n = strspn(node->name, c->data);
>  
> +	if (streq(node->name, "__overlay__")) {
> +		/* HACK: Overlay fragments are a special case */
> +		return;
> +	}
> +
>  	if (n < node->basenamelen)
>  		FAIL(c, dti, node, "Character '%c' not recommended in node name",
>  		     node->name[n]);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
