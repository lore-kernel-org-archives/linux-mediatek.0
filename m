Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0783D767F6
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9ptO2AWHJvDBqBcplJ9x7hVH9AqEur0XDGEUTb8INw=; b=VuqULo+WLnSwU5SxoqtRlblDEG
	NUPgVVz8LVJRrUgfAvkKHo1r5gyINtd+ze4Nq0TUFQvbf0auTU2dMXipZhzulUbcik2xPbrTN58/0
	T/DRLSzxWhBlIUnDhUYEXoeyQ3hvI/Yn2naIlyrUZ1sy9WEvyS9yg+fARlko056VOhliE6VY2SOYj
	RGuXhTMwvHILMrtWZFNjOLtlKCW9HjiupH4YOlRkgBQmvMeTh2Q1uZsCAOyHrdT2eI5U1r6rsaprL
	WHMV89pQW7MlJ5xI0OYPmECc1p6zjqgU0kY8PiU8yw2CriuoMFv2JIUow+jie2TMEU44dtGLIJS+7
	eavFlcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Zor-00000004UZA-0itt;
	Thu, 31 Oct 2024 18:22:53 +0000
Received: from smtp-fw-9106.amazon.com ([207.171.188.206])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Zok-00000004UVZ-2FxC;
	Thu, 31 Oct 2024 18:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730398966; x=1761934966;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=W9ptO2AWHJvDBqBcplJ9x7hVH9AqEur0XDGEUTb8INw=;
  b=klTDZuQafHDrXWKV3LgvT3Y24efrV45jzRPVATk04cip+hThIXAmaViG
   wixXL+1dXsLHiNCUyqwtHGlS0PB7SL298Zmzz44xHDgaKOkzPP4HwscGq
   GpRuHQ3E5WFYNXeR/tB8iHHoY9yqm536zRbxGOnnh+/tT38cwngjQcHsS
   o=;
X-IronPort-AV: E=Sophos;i="6.11,247,1725321600"; 
   d="scan'208";a="771897177"
Subject: RE: [resend PATCH 1/2] dim: make dim_calc_stats() inputs const pointers
Thread-Topic: [resend PATCH 1/2] dim: make dim_calc_stats() inputs const pointers
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 18:22:33 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.10.100:61073]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.2.199:2525] with esmtp (Farcaster)
 id 5b69f371-b19a-4292-b4a0-5c7f596b7e5d; Thu, 31 Oct 2024 18:22:32 +0000 (UTC)
X-Farcaster-Flow-ID: 5b69f371-b19a-4292-b4a0-5c7f596b7e5d
Received: from EX19D005EUA001.ant.amazon.com (10.252.50.159) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 31 Oct 2024 18:22:31 +0000
Received: from EX19D022EUA002.ant.amazon.com (10.252.50.201) by
 EX19D005EUA001.ant.amazon.com (10.252.50.159) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Thu, 31 Oct 2024 18:22:31 +0000
Received: from EX19D022EUA002.ant.amazon.com ([fe80::7f87:7d63:def0:157d]) by
 EX19D022EUA002.ant.amazon.com ([fe80::7f87:7d63:def0:157d%3]) with mapi id
 15.02.1258.034; Thu, 31 Oct 2024 18:22:31 +0000
From: "Kiyanovski, Arthur" <akiyano@amazon.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Caleb Sander Mateos
	<csander@purestorage.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Brett
 Creeley" <brett.creeley@amd.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Claudiu Manoil <claudiu.manoil@nxp.com>,
	"Arinzon, David" <darinzon@amazon.com>, "David S. Miller"
	<davem@davemloft.net>, Doug Berger <opendmb@gmail.com>, Eric Dumazet
	<edumazet@google.com>, =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?=
	<eperezma@redhat.com>, Felix Fietkau <nbd@nbd.name>, Geetha sowjanya
	<gakula@marvell.com>, hariprasad <hkelam@marvell.com>, Jakub Kicinski
	<kuba@kernel.org>, Jason Wang <jasowang@redhat.com>, Jonathan Corbet
	<corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Louis Peens <louis.peens@corigine.com>, Mark Lee
	<Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "Dagan, Noam" <ndagan@amazon.com>, Paolo Abeni
	<pabeni@redhat.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, "Roy
 Pledge" <Roy.Pledge@nxp.com>, "Bshara, Saeed" <saeedb@amazon.com>, "Saeed
 Mahameed" <saeedm@nvidia.com>, Sean Wang <sean.wang@mediatek.com>, "Shannon
 Nelson" <shannon.nelson@amd.com>, "Agroskin, Shay" <shayagr@amazon.com>,
	Simon Horman <horms@kernel.org>, Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>, Tal Gilboa <talgi@nvidia.com>, "Tariq
 Toukan" <tariqt@nvidia.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>
CC: "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "oss-drivers@corigine.com"
	<oss-drivers@corigine.com>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>
Thread-Index: AQHbKys/FLYzAvitdkSVBoM6s5J6lrKhGqwAgAARw2A=
Date: Thu, 31 Oct 2024 18:22:15 +0000
Deferred-Delivery: Thu, 31 Oct 2024 18:21:26 +0000
Message-ID: <7bf7d713339e4854bfcb80c866aa55fe@amazon.com>
References: <20241031002326.3426181-1-csander@purestorage.com>
 <d9c01354-853c-459b-9da4-3c1d77102749@broadcom.com>
In-Reply-To: <d9c01354-853c-459b-9da4-3c1d77102749@broadcom.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.101.5]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_112246_643150_73B64E38 
X-CRM114-Status: UNSURE (   7.16  )
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

T24gMTAvMzAvMjQgMTc6MjMsIENhbGViIFNhbmRlciBNYXRlb3Mgd3JvdGU6DQo+IE1ha2UgdGhl
IHN0YXJ0IGFuZCBlbmQgYXJndW1lbnRzIHRvIGRpbV9jYWxjX3N0YXRzKCkgY29uc3QgcG9pbnRl
cnMgdG8gDQo+IGNsYXJpZnkgdGhhdCB0aGUgZnVuY3Rpb24gZG9lcyBub3QgbW9kaWZ5IHRoZWly
IHZhbHVlcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2FsZWIgU2FuZGVyIE1hdGVvcyA8Y3NhbmRl
ckBwdXJlc3RvcmFnZS5jb20+DQoNClJldmlld2VkLWJ5OiBBcnRodXIgS2l5YW5vdnNraSA8YWtp
eWFub0BhbWF6b24uY29tPg0KDQpUaGFua3MsDQpBcnRodXINCg==

