Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE376C3DA45
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 16:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yotOwh1dtE5DgMK4jrp0VM5GfIPbQCVEmdEcJAa+qI=; b=ZllXemwfA7iSUikLts+jiM3iBP
	uDqsrq5sR03jhU49arsKAkCdQZ1fZ6drXB33JyIGY1e0I4RhJ3VMQjiqUY243APxqX8knl5/t1ctG
	BmK15xe9Or3gw42+ktF8QWzmET0GkI983J32ZZ1Wl4I+cd5g3LwbFIdtGe/hjUd2dXtUmEEqMLfzW
	jFTIHQj3I56IiaPuvtizzXPwCVckHyCBjqoP0Vne5T/xAQwrskXkZBnu950VRpumUvD/c2LekaF4g
	kvgiuHrlkHoVSBg4zjR2vHLq2acKrCC44x9gELzRkCe48GQrHtRGnEmw90hEWVA8jxkt3EC2KhwaN
	tzzyL4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqsg-00000004Mkp-40Zf;
	Mon, 08 Jul 2024 16:06:22 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqsQ-00000004Mfu-3UCr
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jul 2024 16:06:08 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-70b4267ccfcso233584b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jul 2024 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720454765; x=1721059565; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3yotOwh1dtE5DgMK4jrp0VM5GfIPbQCVEmdEcJAa+qI=;
        b=VYQZd3WiTJAaWzIDw+hIJ55jXQNjI2QoPUxI7zjcDmkzD/zl2zyoLV4TIY0tZtjjgV
         Nv8Vl4EEI+5pXE8MHcTZLlQEgen5MxtWekJDmNTN6qXuLaiEMYWcaxQvfZh78a/ORexh
         Hm99wVmpMUBzmCUEj3O1Z+WFZI+bfj09IB1x5vsw0Ub67hwQuyIPDhoWBqKNw+TFY4Pz
         7RHk4SjZ5vAzmPrt9cvAjDDslmsNZu4jD3185EVWrQsH239Aq3lUpZnXnY+VV0ZLMPTz
         bPMGCojF2mPjOXozFZrpVSTnFEFKHcoxlHwiEgto2FBfAKAs6OvlTjzJCwbSoWIxZFPv
         77Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720454765; x=1721059565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yotOwh1dtE5DgMK4jrp0VM5GfIPbQCVEmdEcJAa+qI=;
        b=one8X45LPy5zUczKfF+8wICrKi/6HpD8qmFqCTKVwM91fHjwX7DMEcbxsL7cQgQgRI
         ktXQnVlhsh2J2VSLUJksELKQJ8k/5guyT8tdZlKMOcvgtBwpDdZXyOKgq7oTBFaV3oc0
         wKcDrrFxv9nEA7WJQCH+prlOMXfnDtvLVOk+8RkH86cdhh4/clZRo/HcHeRXuzZm5xNv
         SDv22KJGdNcskO1upirj9kouhkrQYkwC/u386v6bhS9cdp9y/ncMs6Kt7C4XHZx3A9HN
         /tdOpHIUa4XDa+yM6HJH/98fwH9rUnR5mx74jBcTGjFhFI7P38nCPksgL+8fADy4/OPu
         Elvg==
X-Forwarded-Encrypted: i=1; AJvYcCU6tOxGPOmTE3uQS9LtGzrHTjmSQrr/JCZdXUTC9rVNfs7cJYYcQ9LIIe9hG7sppSMRm6bHEBASfzArbMrZ+Wr0JqrW5h+uXBHVh11Z+jC5TLXU
X-Gm-Message-State: AOJu0Yx0tl/FY3nEeA0QuP1ucx158vUjLdU1+PzUnKPiqpRKH2vYpjST
	puTIjZXAHs0TpeXg+yCg7G3GLicKpL3yBHXOTfuqDFNqawroitd78zifXscKr7Y=
X-Google-Smtp-Source: AGHT+IF4pL8APdY3c5DhYc7WskK7MW7W4Z9fYaj4VTZU8WRclPesMbXiUmaRA3FuKwavhdhGST/T1Q==
X-Received: by 2002:a05:6a20:db0c:b0:1c2:8a36:29d with SMTP id adf61e73a8af0-1c28a3613d0mr2559231637.6.1720454765685;
        Mon, 08 Jul 2024 09:06:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f189:baee:28ea:c31c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b5585sm20701b3a.188.2024.07.08.09.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:06:05 -0700 (PDT)
Date: Mon, 8 Jul 2024 10:06:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jason Chen <Jason-ch.Chen@mediatek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Increase MT8188/MT8195 SCP core0
 DRAM size
Message-ID: <ZowOaQ7Atf9D4uoM@p14s>
References: <20240703034409.698-1-Jason-ch.Chen@mediatek.com>
 <f9cbd088-c00c-455f-912b-cc119566e62c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9cbd088-c00c-455f-912b-cc119566e62c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_090606_899963_670346B4 
X-CRM114-Status: GOOD (  10.66  )
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

On Wed, Jul 03, 2024 at 11:05:59AM +0200, AngeloGioacchino Del Regno wrote:
> Il 03/07/24 05:44, Jason Chen ha scritto:
> > The current DRAM size is insufficient for the HEVC feature, which
> > requires more memory for proper functionality. This change ensures the
> > feature has the necessary resources.
> > 
> > Signed-off-by: Jason Chen <Jason-ch.Chen@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>

I have applied this patch.

Thanks,
Mathieu

> 

