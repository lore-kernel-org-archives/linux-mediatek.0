Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDEFC33CB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 05:42:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B0F24656
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 05:42:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n2VkSu7i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iQkGiWWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B0F24656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znVXZR/l87u+fe6m7xxyVr427mrQ2yNFCUxRC2BRS4g=; b=n2VkSu7ivDzQXA
	nAL09Nc9uVxJ2FXtGnP2djLW6hvvaTxCuiqE9pIPzvqpe40nol3tghPtCmyAm67Bd7xADQTvYiHpn
	dVJMK8O5+XdENqeSOQ/EKwquUIvEVFjiU1PTHeGr4CqvVsE1K8IxLTbYbS3cDXyRSGmyCS+8TBpK+
	OMVYDWLAvngfsAJHaUtRYfAkGV1rUTJO+6dtgUUjVvZio5/53oO6Vs+JTk3yPNm42cVx3CtseBt+h
	IGBusZxatrRZkUs+NqWezjaCKOehS1iAwQhFUGBWhq7ruxx8Yu06zR7lFdSTeHZ7mugTtrGoCRaMM
	yiNJPTUy5HyyDVk9soIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irbRb-00063n-L4; Wed, 15 Jan 2020 05:42:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irbRX-0005zn-Q8; Wed, 15 Jan 2020 05:42:17 +0000
X-UUID: dd3b545507e34a21964ea9d495ccfa32-20200114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TZNJZ9TKA1p3YIh669Tp1TrhqTZz02HNKGVqwfnRFw4=; 
 b=iQkGiWWKXMn218uPxovDIHk9XXS7kUvH9orJArOCBaiFIBmoc7d11Ch3Yh3trJbC4wEEl+VzmW20DoHoxocblZpdmZRindgFZ7n7MgDg1QHEwSG4c+qisRl3Fw5jk60o7S+claF9n6pBn1KZvY8JRwVe2nePf8cI20RSS60il6M=;
X-UUID: dd3b545507e34a21964ea9d495ccfa32-20200114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jamesjj.liao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 907159954; Tue, 14 Jan 2020 21:42:10 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 21:32:55 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 13:31:36 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 15 Jan 2020 13:30:13 +0800
Message-ID: <1579066321.30255.3.camel@mtksdaap41>
Subject: Re: [PATCH v2] arm64: dts: mt8183: Enable CPU idle-states
From: James Liao <jamesjj.liao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 15 Jan 2020 13:32:01 +0800
In-Reply-To: <e046d80c-07fb-7d45-309e-6f55dd8b0dc2@gmail.com>
References: <1578996673-8140-1-git-send-email-jamesjj.liao@mediatek.com>
 <e046d80c-07fb-7d45-309e-6f55dd8b0dc2@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_214215_862369_40D28499 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-01-14 at 12:14 +0100, Matthias Brugger wrote:
> 
> > +		idle-states {
> > +			entry-method = "arm,psci";
> 
> reading idle-states.txt the entry-method should be "psci".

It will be correct in next patch.

> > +
> > +			MCDI_CPU: mcdi-cpu {
> 
> I wonder what MCDI stands for. Normally we have CPU_SLEEP and CLUSTER_SLEEP here.

It means MCU Deep Idle. But you are right, CPU/CLUSTER_SLEEP is more
readable. So I'll change their name in next patch.


Best regards,

James

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
