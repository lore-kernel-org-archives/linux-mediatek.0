Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD592C25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 04:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7agB2hnFewpjax4kbphsD93u3QsGRdWR8JFRIQ77D8=; b=H3cF9dw65byQu2J+RPv4QQH5VI
	Tz8Pxo6fg6zIgviNUKCh+swAb+qU6wxTh72CbXF5T9QPEnXthxSbxAK479hzJ5R72qmEZQ4y+uqhf
	ZH/tfk3kAF4+SY2KWRXQHuNvuxmC1iURQjL56cpKaqSWGPHNvz2kpmtwytlrOtmC7nfGCQg2bxCZT
	5vBk+QpzWMyX05v2ZQsdDg4LjREgD1EC28/tgGmPp0mCgiVkkjNxRFGI8PZjZjwFKvsFQCQGr1xo1
	rFRcnuEdKHpJDcKWfyD9EYRqTcEcqGl+7uVYlNZA7dw0uy6B8y57yF/Pg5T9kSaLdC10KyZK7S5zM
	BHreKl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOtTd-00HP2D-UM; Fri, 19 Aug 2022 04:19:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOtTZ-00HOy6-Fa; Fri, 19 Aug 2022 04:19:19 +0000
X-UUID: cb7d89e0b5514b30917ea21de44c654f-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=m7agB2hnFewpjax4kbphsD93u3QsGRdWR8JFRIQ77D8=;
	b=kqrMB8i9hhDwuG310TE7t18O/vC2W7nKvv9EuHW+XU+4/UcMH+OdJ88/Qj4GbtW/YpwreJH1SLaIshEp1fDgxiHoLboGp3/bHQMnNfMkWJ9aQN7kYA/FA1rb+7hb0U0eWRTWpmcRmstgcvXug/ZvRsuCfBt63/eVyagyDNmiGTM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:2b291369-c039-447c-8514-afe6c9148c97,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:1a1dc1fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: cb7d89e0b5514b30917ea21de44c654f-20220818
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1224725284; Thu, 18 Aug 2022 21:19:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 19 Aug 2022 11:28:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 19 Aug 2022 11:28:31 +0800
Message-ID: <726ec17f1b8d42f7ec9858a54ee952cb53f03188.camel@mediatek.com>
Subject: Re: [PATCH 3/3] dt-bindings: nvmem: mediatek: efuse: Add support
 for MT8188
From: Johnson Wang <johnson.wang@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	<matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 19 Aug 2022 11:28:31 +0800
In-Reply-To: <8ab34dd4-ca5a-2824-ccbf-867996ac6536@linaro.org>
References: <20220715120114.4243-1-johnson.wang@mediatek.com>
	 <20220715120114.4243-3-johnson.wang@mediatek.com>
	 <8ab34dd4-ca5a-2824-ccbf-867996ac6536@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_211917_600852_ECEF3823 
X-CRM114-Status: GOOD (  18.06  )
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

On Wed, 2022-08-17 at 13:21 +0100, Srinivas Kandagatla wrote:
> 
> On 15/07/2022 13:01, Johnson Wang wrote:
> > Add compatible for MT8188 SoC.
> > 
> > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > ---
> > This patch is based on "linux-next"[1].
> > [1]
> > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git__;!!CTRNKA9wMg0ARbw!yz8fBHH39-ntsRnAlXZfmS1k9PoKMtITUk-DhcvGQJOJSu9HP70OmFoCYMfvxnjWw4Ql$
> >  
> > ---
> 
> Applied thanks,
> 
> --srini
> >   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > index b5a1109f2ee1..75e0a516e59a 100644
> > --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > @@ -30,6 +30,7 @@ properties:
> >                 - mediatek,mt8173-efuse
> >                 - mediatek,mt8183-efuse
> >                 - mediatek,mt8186-efuse
> > +              - mediatek,mt8188-efuse
> >                 - mediatek,mt8192-efuse
> >                 - mediatek,mt8195-efuse
> >                 - mediatek,mt8516-efuse

Hi Srinivas,

Just a gentle ping on this.
It seems that this patch hasn't been applied into [1].

If you have any concern about this patch, please let me know.

Thanks.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git

BRs,
Johnson Wang


