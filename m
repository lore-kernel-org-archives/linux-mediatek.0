Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44830C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEKISakAf0TfkjN2ZkpulaT550J7/MhnHt9FcU0gk5c=; b=LYPBa0K5TcEiAr
	Bzj3lc763M543kg6aiUU8ADtkp4RsaX2rcP0P9VJNE+n5yuU8KyvOmejaj8wylymt1r0lFyiqgTD5
	ruEK/3zWlM+u0MnPcZkFuP4hiUEcPAi6JcWZdkAAVww5j8v/ABIbJx8YTevtLuSsysYiLzVFp9GOw
	smozGCeicCPz56BCRC/bk/fghwavla3R0EsCN7XuNL/X/BeGPRSCy0P0sYFMVT1pfo3xadR8asQix
	xfWBiEgNufYDX6kE2vJ/lEbFea7pyBYVJ3LAdKRX2gNYyzhcr0OKyUNk7nIpIayxMqlgoySTZhEJI
	plESrMDBqSD4K155O58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni2GA-002lo9-IQ; Fri, 22 Apr 2022 23:00:18 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni2Fy-002lkj-2T
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 23:00:07 +0000
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e68392d626so5060641fac.4
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Apr 2022 16:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ElI2t4nByDOB6dr+yLR266lxMKTIEX40DDSnpkzAfdk=;
 b=AAL18eX8s5pFrRM+VhPDxLjLMGLkQCN9PL+jVRgw0V7kN4VQZrGyrC9yvnUkDDTA9m
 kUoPiX2AeDEFGlhQgafrnJM6b0hbFWx6As1XdFyzsaPMNT+LFL88wT8KL6EtbHBVMNiY
 XmAZFpWedjwOngPwoyeeBAkh1yzof7YA1rRPwXRc4zrYY9xeqwYv73OLXw569g5RyDJ/
 4UItx60O5ACzGqIv8o1yXv3z55PWWdx2axpX7VycwhT98ePwWGv8hegxjQnUJGFg1Nsc
 Uj1hIqqdCUTMkyisAjlr4sM4FbKyYp5nyDGNaJ/+DYjN1Lwjt3DbfgXDofNsTFiWo2YU
 ZsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ElI2t4nByDOB6dr+yLR266lxMKTIEX40DDSnpkzAfdk=;
 b=FmJtrfC9Kz6X/X+Rw3AuWbuWG0oki1rdDqwqx8l0NZ36DcDi4SnisAMUrrl56YgrJN
 2PbI+THuAeiUEvjV9hsVUBvN5shYMmVRRw4I47gAsevYRLZ27a9kGOQ8zL6o4UdIl8AU
 jML85QrBSDnfm05tp2G48p0iPLpZNE15/AZZt4SuHBrb3pl8nSH4NVbVNtMPReUFmQ8+
 b+4Sxbw876SXsJbZ0I+4mWGKsCEEfVqu7b3DHPRXjW4E8zyHwACJpTvSDA/HCfCKfI67
 fKZaqzcoX3iOB+Sb3WFqmXXLi5K5gttKJ/j5xvaMbXF6eemM2eEmXjPeFpe+ssrASPzB
 Q6ZA==
X-Gm-Message-State: AOAM5300lvizwJkMUIxBNeG89EenNEnqGbB5r/RCbGCfsQluDdaHFig/
 y1GTRF5ESMinxLD4X/l5EHWXMA==
X-Google-Smtp-Source: ABdhPJyhzjfmiSNV9pg+MVvlFlGDkq8CvnWd0Mwcnumh+SSclYdBOE1HNA5Unl92+fFrCF1gMYMSkg==
X-Received: by 2002:a05:6870:ea89:b0:e6:4acc:9302 with SMTP id
 s9-20020a056870ea8900b000e64acc9302mr3081663oap.203.1650668403484; 
 Fri, 22 Apr 2022 16:00:03 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 v65-20020aca6144000000b0032259d24076sm1250566oib.30.2022.04.22.16.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 16:00:02 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v1 1/3] dt-bindings: remoteproc: mediatek: Add
 interrupts property to mtk, scp
Date: Fri, 22 Apr 2022 18:00:01 -0500
Message-Id: <165066838719.2742284.7900096409445311556.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225225854.81038-2-nfraprado@collabora.com>
References: <20220225225854.81038-1-nfraprado@collabora.com>
 <20220225225854.81038-2-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_160006_134750_BF6ED785 
X-CRM114-Status: UNSURE (   7.24  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyNSBGZWIgMjAyMiAxNzo1ODo1MiAtMDUwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8gd3JvdGU6Cj4gVGhlIFNDUCBub2RlIGNhbiBoYXZlIGFuIGFzc29jaWF0ZWQgaW50ZXJydXB0
LiBBZGQgYSBwcm9wZXJ0eSBmb3IgaXQuCj4gCj4gCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8zXSBk
dC1iaW5kaW5nczogcmVtb3RlcHJvYzogbWVkaWF0ZWs6IEFkZCBpbnRlcnJ1cHRzIHByb3BlcnR5
IHRvIG10ayxzY3AKICAgICAgY29tbWl0OiBiN2RhNmY1MTcyMTRjMzA3ZWZlY2U2MDRhYzlkYzU4
ZGM2MTIzYzA3CgpCZXN0IHJlZ2FyZHMsCi0tIApCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVy
c3NvbkBsaW5hcm8ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
