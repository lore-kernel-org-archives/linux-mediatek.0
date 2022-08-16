Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFCCC2BB41
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cc5a/Z1OZQ/Sp4oex9dmkDkQnrPr8Y8hlCBI2uCYHzA=; b=jjAR2/oEQDlqr4kCVbVPAswZ17
	l/z8WyNKxPNsGQ/6cHlm4CQL4ByKnTKQyyhv9qBS/pvKe5HtfbYTHEOHEvXuNHGH66ARla4MyV4Zk
	8PV+fcYJhtxJf1ARBc4kU+ThmqdbCCFiGtio2HyV1xTW6tgiSBgG2uDXxaN71wwNi6pWj7y3buROk
	nB8jCYUwAlr4Iy2gjuyLupZBo2ZYEAM1vC/QitRaR6ThHO698qB3b2S/gBKWuZsZfjV9esBSTDbBi
	yNKRAmco2DOp+88/WTg4KQP8ZL+FSMQ4NW6oHekVUYsOpg4PE0wvBFLE29Zf/Tx6JpVirDHkqIVId
	HrtP7CTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsmP-000DJ3-1e; Tue, 16 Aug 2022 09:22:33 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsm0-000CqU-8X
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 09:22:09 +0000
Received: by mail-lf1-x133.google.com with SMTP id r17so14036289lfm.11
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Aug 2022 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Cc5a/Z1OZQ/Sp4oex9dmkDkQnrPr8Y8hlCBI2uCYHzA=;
        b=fiDRi2HZhnLH0aZUZxx5zMFYg+kRxqfZ8b/gbzXvdbEOMUSsLkKCvcNynL4hySDQxA
         m1GK8w5qxNUXZbhnbUOAb/RWoVguEnK7mq6wmLTVFwGDw++AVwE97trf0cZJGRUKHk4B
         ugdqIQgEN/iEh8C4L4b5JRrnQ/26tifMaIyc4O7HpNoSyICCI3YfXHi6BEJAVxkwfsoC
         4dXDHxU+eadTKBUHD1fgqE6Zq3Hmseu0E10W0cwd/dRDKo7b7wWBN7zhjkCK4R6N9lSf
         qRZ/bk+TKFGA2FewRcrhJcWB7mn/MYynRQCArUicMErP3l3KcqAYTACWZ1/r4jHH8EoE
         HRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Cc5a/Z1OZQ/Sp4oex9dmkDkQnrPr8Y8hlCBI2uCYHzA=;
        b=0OPVVD9fHaaj7RHgiaAF+HdScTVfRUpjH6XRBDX6bJDR2dM98MBsAxQePpMYEwJGjS
         FbdJQmPnJkRlgbKL2Dvkce9YCHhQCT83GmOl3tVl4pkQTOUQMdiLFC7MR2YMFK5TGfbT
         k3DsG1u42ci9MOyVCMBVkzeCEL5aXK097bgEjSCs+4H5MN67MTtgunXKwCWZqdh1ZBxW
         hfgthXlUFMSJmA9JuicBm2w5dJcxqpP3PxNbUBUwo4tuFZrDkm5JD1rzOHo+XuRKiQET
         8rkyI+ciqCBvqZHLUuSB98GgyzaufXAC60f8BDtenwo2tgJ9uvIgFsosRTWKDvRh1R1Q
         /EtQ==
X-Gm-Message-State: ACgBeo3GZ30dcnkEqG7XDhnIc9BJDdz6SGcGjKikGI7fRa1WspetMkS9
	GDDO0HJSZ4F+wLxxJCaZPd+13pQXVx7ktmUY
X-Google-Smtp-Source: AA6agR7LFK/9gYrW8u+lnQRIAyItIlW8HzneqHrf3znVQXnPj5MscIKAG/LghM5wSDnWni05dkHGvg==
X-Received: by 2002:a2e:80da:0:b0:25e:6d34:6169 with SMTP id r26-20020a2e80da000000b0025e6d346169mr6447417ljg.531.1660641722837;
        Tue, 16 Aug 2022 02:22:02 -0700 (PDT)
Received: from krzk-bin.. (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512215100b0048aea84fa80sm1335691lfr.87.2022.08.16.02.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 02:22:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: yong.wu@mediatek.com,
	robin.murphy@arm.com,
	lee@kernel.org,
	angelogioacchino.delregno@collabora.com,
	robh+dt@kernel.org,
	tinghan.shen@mediatek.com,
	mandyjh.liu@mediatek.com,
	will@kernel.org,
	joro@8bytes.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v4 02/20] dt-bindings: memory: mediatek: Update condition for mt8195 smi node
Date: Tue, 16 Aug 2022 12:21:59 +0300
Message-Id: <166064169630.37858.3837655509098916044.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220729063208.16799-3-tinghan.shen@mediatek.com>
References: <20220729063208.16799-1-tinghan.shen@mediatek.com> <20220729063208.16799-3-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_022208_329128_11228B00 
X-CRM114-Status: UNSURE (   7.39  )
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

On Fri, 29 Jul 2022 14:31:50 +0800, Tinghan Shen wrote:
> The max clock items for the dts node with compatible
> 'mediatek,mt8195-smi-sub-common' should be 3.
> 
> However, the dtbs_check of such node will get following message,
> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0'] is too long
>          From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> 
> [...]

Applied, thanks!

[02/20] dt-bindings: memory: mediatek: Update condition for mt8195 smi node
        https://git.kernel.org/krzk/linux-mem-ctrl/c/9f8fb8032febf594914999c33493c682eaf138cb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

