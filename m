Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 02:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OH2rZO3VsGCZgqrMmx0iXAEOCIFPhGwgeDFUMSyt5Xc=; b=VmXyCkt8axAvrV
	KLL8ftGbwI8/hsPLMWVkbeIts4BqS8bkWDtgAsnwXZvYXxG6u6tt9D4yeJ/6bvc/1/uaQmZWZFvJL
	lMeGXM5Vku0IcoexzUSMJGY0mLfdF/lST7EuEDOBmdZ8tXtTez4rbhufMTeSVJMPF6Qy7Sy0Ym/l+
	qGPz3UznnzAUBNZN5obVwBgQ3FkT59kYyAPTFYrurJ4zMzxCw8nQfCM+bFuqB6TO+fF0wyFczo0T3
	PbcTA7feeC9ew74edR1uwJADh/PurB94DTYSS2khmTuDSEdG3lgw64LCXYzmkIjWih3A3ZqNOpbSA
	uTBu7bBa8ivs7h3Zwenw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nocMv-004rV7-Uf; Wed, 11 May 2022 02:46:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nocMc-004rOp-Sx; Wed, 11 May 2022 02:46:12 +0000
X-UUID: bff2b0db9b314d798c963c3cb92a7dbc-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c1537b21-4244-437d-a287-66f8680b3e62, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:b05f05e6-38f2-431d-8de7-bf8fac490b0a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: bff2b0db9b314d798c963c3cb92a7dbc-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1200386641; Tue, 10 May 2022 19:46:05 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 19:43:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 10:43:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 May 2022 10:43:14 +0800
Message-ID: <73b1feab3ecb20fef0339b322a61d63146b5790a.camel@mediatek.com>
Subject: Re: [PATCH v4 0/3] dt-bindings: nvmem: mediatek: Convert efuse
 binding to YAML
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Lala Lin <lala.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Allen-kh Cheng
 <allen-kh.cheng@mediatek.corp-partner.google.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Date: Wed, 11 May 2022 10:43:14 +0800
In-Reply-To: <20220510132637.5864-1-allen-kh.cheng@mediatek.com>
References: <20220510132637.5864-1-allen-kh.cheng@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_194610_965346_AB29BD19 
X-CRM114-Status: GOOD (  17.23  )
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

Hi the reviewers,

Please ignore this PATCH series.

There is anther series for efuse yaml (
20220509014521.10248-1-chunfeng.yun@mediatek.com) by chunfeng.

We will integrate together and resend again.

I apologize for any inconvenience caused.

Best regard,
Allen

On Tue, 2022-05-10 at 21:26 +0800, Allen-KH Cheng wrote:
> From: Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com
> >
> 
> Convert MediaTek eFuse devicetree binding to YAML.
> 
> Based on tag: next-20220510, linux-next/master
> 
> Run cmds as following:
> make DT_CHECKER_FLAGS=-m dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/nvmem/mediatek,efus
> e.yaml
> 
> make ARCH=arm64
> dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/nvmem/mediatek,efus
> e.yaml
> 
> We mark the mediatek,mt8173-efuse and mediatek,efuse as deprecated to
> indicate
> not use a signle compatible and should always use mediatek,efuse as
> generic
> fallback.
> 
> change since v3:
>  - use mediatek as vendor name instead of mtk
> 
> changes since v2:
>  - document deprecated efuse property
>  - update efuse compatible fallbacks
>  - add two PATCHs into series
> 
> changes since v1:
> - change file name from mtk,efuse-yaml to mtk,efuse.yaml
> - add efuse in commit title
> - change compatible entries from const to enum
> 
> Allen-KH Cheng (2):
>   dt-bindings: nvmem: mediatek: Convert efuse binding to YAML
>   arm64: dts: mediatek: update efuse compatible fallbacks
> 
> Allen-kh Cheng (1):
>   dt-bindings: nvmem: mediatek: document deprecated efuse property
> 
>  .../bindings/nvmem/mediatek,efuse.yaml        | 60
> +++++++++++++++++++
>  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 -------------
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  3 +-
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  3 +-
>  4 files changed, 64 insertions(+), 45 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-
> efuse.txt
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
