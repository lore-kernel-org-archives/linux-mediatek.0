Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA263606A325
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=37zUE1ti;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=HZ1IwjqT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bM/x8mW1K8KY6JBLdtbGHOmsga/Cv/oa26lN+auSggw=; b=37zUE1tiQc0I4I871f6lC5NDVd
	Yu/Uf5g9TJh5P7T1MZIFnfK0ATvoA9tWrHMBqTSb4CGMou9pL3e0owe1j77TeGT7ecDb+ng8yJqjI
	jlLTxOLNrmtrdd1IKgHrQX9QRHj+GLHvHVP7gsq2uOtCjlEDAeSYQLLUhf3+kKurGZctNlaGcwFL9
	/St+SiiDfLK3MTWNqOEs8bi6T85CJzrbGJo2QdrMbdSLjU1glBCXAHxvrMtH5TJA5bfI6+wI+SOdQ
	qGXC25jLXraCHaak6sh2VSkmSgoRFKIiRJJsq8MBJ9Jd1osTW2kBq/IPOM2Mi6ZF2zhn03NerOXTQ
	GGk6h7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIHW-0000000EAbn-2aUD;
	Fri, 20 Nov 2026 06:39:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIHU-0000000EAay-2kim
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 06:39:34 +0000
X-UUID: 217a1894e4ad11f1afed4741b24580c9-20261119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=bM/x8mW1K8KY6JBLdtbGHOmsga/Cv/oa26lN+auSggw=;
	b=HZ1IwjqTTxYGMWsFFoLVY5ZWcxJeweUisOaNwGATZgm+J5dn13ifLMOJ0XS2Spv8Lt/DXvenDvrk7d97MZTH9lptGKTx9odBGWCgVe1+I2U8VVcCxzWIJa6SxjqnXimAj1/+v8PqfkydnbrD6Lf6wcbLEeeYejfQvLKQmZBfDrM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:d0224927-66a6-45db-9b95-6af6296368ee,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:95da8d66-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 217a1894e4ad11f1afed4741b24580c9-20261119
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2128251828; Thu, 19 Nov 2026 23:39:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Nov 2026 14:39:24 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Fri, 20 Nov 2026 14:39:24 +0800
Date: Fri, 20 Nov 2026 14:39:24 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: Linus Walleij <linusw@kernel.org>, Mikhail Kshevetskiy
	<mikhail.kshevetskiy@iopsys.eu>
CC: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, <lorenzo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <naseefkm@gmail.com>, <benjamin.larsson@genexis.eu>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<lei.dong@airoha.com>, <ansuelsmth@gmail.com>
Subject: Re: [PATCH 00/12] pinctrl: airoha: configure GPIO muxes explicitly
 and fix pad mappings
Message-ID: <av_rHJ5W-mq3UAZ3@mediatek.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <695991a0-ae67-4ce0-9b92-f191ae97a468@iopsys.eu>
 <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_223932_706101_57AA45F6 
X-CRM114-Status: GOOD (  21.50  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mikhail and Linux,

Thanks for the feedback. I investigated the formatting issues on my
side, but have not yet been able to reproduce the problem.

I sent this series using git-send-email 2.43.0, without manually
copying or pasting the patches into an email editor.

I also retrieved the series from lore using:

  b4 shazam 20261110094339.749110-1-zhengping.zhang@airoha.com

All 12 patches applied successfully on top of my local pinctrl/for-next
at bc843179e208a. I also checked the archived patch messages and found
no apparent encoding issues. I understand that these checks do not
rule out formatting problems in the copies you received.

Comparing the archived messages, I found that, for example, tabs are
preserved in the original patch 05/12 and in the quoted code in
Sashiko's reply:

Original:
https://lore.kernel.org/all/20261110094339.749110-6-zhengping.zhang@airoha.com/

Sashiko's reply:
https://lore.kernel.org/all/sashiko-outbox-206823@kernel.org/

However, the corresponding quoted code in Mikhail's reply has tabs
expanded to spaces:
https://lore.kernel.org/all/80e72b60-3128-4594-a4bf-bb184ffc754b@iopsys.eu/

I noticed that tabs are preserved in Mikhail's reply to Miquel's SPI
patch, so this does not appear to happen with every reply:
https://lore.kernel.org/all/37fc133b-a5f3-4b4d-ba2a-002239bbcebc@iopsys.eu/

Could you please share one affected incoming patch as a raw .eml
attachment, if possible? It would also help to know how you retrieved
or saved the patches, and wheter the formatting problems are visible
in the original message source. This would let me narrow down where
it changed.

Thanks for the suggestion to use b4. I will use it to manage subsequent
revisions, and will address the code review comments separately.

Thanks for your help tracking this down.

Best Regards,
Zhengping

On Wed, Nov 18, 2026 at 10:15:15PM +0100, Linus Walleij wrote:
> On Sun, Nov 15, 2026 at 3:10 PM Mikhail Kshevetskiy
> <mikhail.kshevetskiy@iopsys.eu> wrote:
> 
> > Hello Zhengping Zhang,
> >
> > Please fix your patches. Looks like you insert patches to the e-mail body,
> > thus your patches were converted to "mail encoding"
> > * tabs was replaced by spaces
> > * unchanged empty lines "<space>\n" were converted to just "\n"
> > * long lines were split with "=\n"
> > * "=" were replaced with "=3D"
> >
> > and so on. So please use "git send-email" for patch sending.
> 
> I agree, I can't work with this, maybe review a little.
> 
> If possible use the b4 tool to manage your patch set(s).
> 
> Yours,
> Linus Walleij

