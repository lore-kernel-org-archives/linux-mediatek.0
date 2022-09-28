Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC609C04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 07:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twBFZvQndTAJep03Qp9HrLxape++Wqs0xYwSivoNI3Q=; b=jup8Ut1NQpQ886CbyUtMTLFpNc
	S9HHwHCzu0DlzG2mi7XSP2iEpba73KrT82dUGX9LMImh/LOgtY96Y0dru3cF7roADGcSPLRX4IvmZ
	pRRK/3aZRLj2mrIu6nshLHL+9D0KVtkMy+9tNvoBnwKf/eLeZhBvEDDl+8NSsvgqr16f/yMxekKGG
	7JM2o5y3i/mMp3i5R5j1TKOWXWF5LHwZAeI86aZX4TEDpH+HjkmnwuBUCqQKTseiVVyN53mMDlJzT
	s0SDqbcT42QeyfHZtkr/k1FRhp484iaRje2P+RdqTXTnrR+YPFsXsw9PB4z6qzwERpSZv0s5DnOlv
	1a2ekWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRgU-00Ebmr-4x; Wed, 28 Sep 2022 07:40:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRgD-00EbdI-Pt; Wed, 28 Sep 2022 07:40:31 +0000
X-UUID: 6ea634be12884624a57a760ace036f3e-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=twBFZvQndTAJep03Qp9HrLxape++Wqs0xYwSivoNI3Q=;
	b=DIwcsLObG97GUH7hrj9xrg44qEOueuXU1Die6rl0wEQcHA5K+5lj/K5jty7CeCc0Ue/mgOV1fjJeahmCYWBOzEP5rp3UMNzmhRqXy+Pyap0u1ZTFfeTHGEolhKugoedDC5T9YYRklKkhVNor23vVGeOGeTPNzp3srtQIs+jy0u0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b0afe3f3-fb06-42b6-ac79-464284343ab8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:036457a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6ea634be12884624a57a760ace036f3e-20220928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 249603362; Wed, 28 Sep 2022 00:40:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 15:40:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Sep 2022 15:40:00 +0800
Message-ID: <7c46b223e4ba5d1ceb587facf7dd060e6cab9f17.camel@mediatek.com>
Subject: Re: [PATCH v5 4/4] net: stmmac: Update the name of property
 'clk_csr'
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, Biao Huang
	<biao.huang@mediatek.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 28 Sep 2022 15:40:00 +0800
In-Reply-To: <ff577b86-44c8-3146-3388-78021bb7edb4@linaro.org>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
	 <20220923052828.16581-5-jianguo.zhang@mediatek.com>
	 <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
	 <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
	 <4f205f0d-420d-8f51-ad26-0c2475c0decd@linaro.org>
	 <80c59c9462955037981a1eab6409ba69fc9b7c34.camel@mediatek.com>
	 <888703a8-a8e5-e691-7a53-294f88ad7a4e@collabora.com>
	 <ff577b86-44c8-3146-3388-78021bb7edb4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_004029_889342_F143E30A 
X-CRM114-Status: GOOD (  17.29  )
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

Dear Krzysztof,

	Thanks for your comment.

On Wed, 2022-09-28 at 09:17 +0200, Krzysztof Kozlowski wrote:
> On 27/09/2022 12:44, AngeloGioacchino Del Regno wrote:
> 
> > > > OTOH, as Angelo pointed out, handling old and new properties is
> > > > quite
> > > > easy to achieve, so... :)
> > > > 
> > > 
> > > So, the conclusion is as following:
> > > 
> > > 1. add new property 'snps,clk-csr' and document it in binding
> > > file.
> > > 2. parse new property 'snps,clk-csr' firstly, if failed, fall
> > > back to
> > > old property 'clk_csr' in driver.
> > > 
> > > Is my understanding correct?
> > 
> > Yes, please.
> > 
> > I think that bindings should also get a 'clk_csr' with deprecated:
> > true,
> > but that's Krzysztof's call.
> 
> The property was never documented, so I think we can skip it as
> deprecated.
> 
We will send next version patches according to the conclusion.
> Best regards,
> Krzysztof
> 
BRS
Jianguo


