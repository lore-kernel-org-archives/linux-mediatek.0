Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8F5C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pd8U/PCi0p6o8UgaJg/HLKkspvkAHB5A6pexOvPjfR4=; b=cDdi47NlAwX6DLvBBmoZ90M/eu
	OyAeubTJm5G0qVTuOXDW6CMbCBg8wY+oLIL86vpGo0DeoANNFRJdND1ljIUdcV2/PxT8P+X5LseH1
	rLnyL1UGiAxFC0OxGNonqB5NdLvlOnJPy8OFJOqM4Opl2QOaJRKVMJC2u+aMk31818GS99kKBrUMH
	Y5/SZRzKAsTXLnyMkDaNQjQM+tt3FQM5QaYF6BW+wu6NTX2CnBIyuPzn6bOkZLUS9Kc5d2xzHHiAo
	FB614I3eD94kjPVtGmB4s53kzh3umfRg/+HNVbf7QmMGyCgysvt316JQ+t7cWUbC69fp2Acifxdjc
	SchGLFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUmq-001mBc-Ub; Fri, 24 Feb 2023 09:54:44 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUmd-001m4c-NM
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:54:32 +0000
Received: by mail-vs1-xe29.google.com with SMTP id o6so20984451vsq.10
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd8U/PCi0p6o8UgaJg/HLKkspvkAHB5A6pexOvPjfR4=;
        b=KVBqsIOUbphURupL/Z7Haw0sLK34ZhqLI14Zv6P1iiGy1OGYTBYzEb0wc5M6tuiyFI
         ujCiYCDkCg3cptrEb1R18nTEuWYEsAR8Ijp9n/zIWKWnbg0ARFOu7TL791vlu/BgFYz2
         Hg6dVzhahUTBzfexhFW6sCDEYFMrlUcEt/Shg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pd8U/PCi0p6o8UgaJg/HLKkspvkAHB5A6pexOvPjfR4=;
        b=u9dHfnb2geJeTgvuMi/XJzVMMers6xrnlZdoejtgj5NBylKnvOa/KkW5TaJP/lXjGF
         nUy/ksUFw6HqiBoMv/qyjuW3MjGReBpkl9XYf387PHurT/RJlhMvOCQVUQ3NGMgwurPT
         GUvGlpLvrGQ7tPytNFtnzCH+jgmPPLiVtEqepD1PfFfDKVs+2NsQ7uihyCgTvEBiWMg9
         UWfmpjlhxQvv6YceJsDBp8aD5grKIMepbqMhiDd6Mwujsy6p3P146NZPdMClspDLTU9e
         wdrGHhgsLybbjfoTigPY102ZvZDukyLbN7cHdrSgDnjo+I62oVCDekTIgofXBcFQF65F
         G9tQ==
X-Gm-Message-State: AO0yUKU9UDTJ+iuVvNLvIuK0tw6LpQp+881dZy+p00vzZs3VY70QvhPz
	yVBAEpwhLQEbz7+kUFV9/1Hte8Oou2HEpUQp40SM0Q==
X-Google-Smtp-Source: AK7set/5nxZl0eckNXI6Q503VgTEGQfN71DtPSOnMcy7mMkQne8mOsAfpJuhK2AcNqxwdbl36ZLhTsBZt57SOZ7m6V8=
X-Received: by 2002:a05:6102:3a61:b0:412:2ed6:d79b with SMTP id
 bf1-20020a0561023a6100b004122ed6d79bmr2017113vsb.3.1677232470933; Fri, 24 Feb
 2023 01:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:54:19 +0800
Message-ID: <CAGXv+5HgfRbuyJM9Xk31TC8bgSGTCoeV-N+4wSVXmqskGHD_Ew@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] arm64: dts: mediatek: mt8183: Use
 mediatek,mt8183b-mali as GPU compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015431_767885_842339F7 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 23, 2023 at 9:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Use the new GPU related compatible to finally enable GPU DVFS on
> the MT8183 SoC.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

