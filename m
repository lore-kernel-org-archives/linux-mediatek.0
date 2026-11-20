Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6F8606A334
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 07:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pPXZ+Drr;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=olkXP7aR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bjcBK2Jp+j7uKnBDu+KecoXiIuvzpZoiWmlv9+9ycts=; b=pPXZ+DrromL7S+JdblDlsjg0Fc
	5CEO9rUQS04WskwxmtGCJ+M/8ECpo2xhnknWE3P0bGisEtmY3dkJuFj40ilQbwBQFuft6z7Z5PQHf
	Gbz57VMPkN9NOVeF5Ksx50eunhR4L18U0xJ0mqdGcQGsQ9ekZVm13INjb+s1aUe7fEaTLsT0/9sd6
	OdMcw1Pnz/EwSGwsfeSWgVrJPtywVIh3km+wbTTeih1z3ZZ4ykqzSg0QfZnLYOoG1GE9Qx6glGDg2
	UdF7q6Il9q1w/seWf1xHeCYQLKA9dPPIQiOyhZniXmpWDBEcAE0/v3xfQ9F8RWYjDkkM6uiSoCVWf
	wgievWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIuJ-0000000EDKu-0nfp;
	Fri, 20 Nov 2026 07:19:39 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIuG-0000000EDKO-2Pnv
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 07:19:37 +0000
X-UUID: b9f60d58e4b211f1afed4741b24580c9-20261120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=bjcBK2Jp+j7uKnBDu+KecoXiIuvzpZoiWmlv9+9ycts=;
	b=olkXP7aRi6nhiVi343QgDDSd5rZDx4hE7yvhpFNHZfVTlC5gIc0mBrzYvJm5/l8bfrrenT/X+hg6jMDv11QlQMkdHtVqAuiBQwoFDIj5gYbbQ+K95VKLR9X9ilrgvzMaO6p4LWFuCT87r1tOe97Ir7/ZlBW6ey/fI1Fvjgv3xo4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:e03b5077-e1dd-4b60-930e-69e8c1081837,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:37c2d419-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|136|836|865|888|898,TC:-5,Content
	:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b9f60d58e4b211f1afed4741b24580c9-20261120
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1810719681; Fri, 20 Nov 2026 00:19:30 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Fri, 20 Nov 2026 15:19:27 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Fri, 20 Nov 2026 15:19:27 +0800
Date: Fri, 20 Nov 2026 15:19:27 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
CC: <linusw@kernel.org>, <lorenzo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <brgl@kernel.org>,
	<naseefkm@gmail.com>, <benjamin.larsson@genexis.eu>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<lei.dong@airoha.com>, <ansuelsmth@gmail.com>
Subject: Re: [PATCH 05/12] pinctrl: airoha: an7581: select force GPIO mode on
 GPIO requests
Message-ID: <av_0f3bRXyWTSUYy@mediatek.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-6-zhengping.zhang@airoha.com>
 <80e72b60-3128-4594-a4bf-bb184ffc754b@iopsys.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <80e72b60-3128-4594-a4bf-bb184ffc754b@iopsys.eu>
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_231936_626237_5F37271C 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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

Hi Mikhail,

Thanks for the suggestion. I agree that selecting GPIO mode by disabling
the relevant functions would be preferable to use the FORCE_GPIO
registers.

I plan to change the implementation as follows:

- Select GPIO mode by disabling the relevant alternate functions,
  without setting FORCE_GPIO. Reject requests that conflict with
  existing users.

- When selecting a peripheral function, clear FORCE_GPIO overrides
  where needed so that the peripheral can control the pad.

Would this approach address your concern? If it looks reasonable, I will
adopt it in v2 and validate.

Best Regards,
Zhengping

On Sun, Nov 15, 2026 at 05:21:15PM +0300, Mikhail Kshevetskiy wrote:
> I think it's better does not play with force gpio registers and just
> disable (if no conflicts) functions that put selected pin to non-gpio mode.

