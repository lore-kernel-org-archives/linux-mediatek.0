Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8133C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q818iMHzVBVmVT4CCTpT313nYF1LwDuhQ5Wo0/o9I78=; b=0kILexbU+ua8bO1VJVgNGmyaJA
	BVrg2X+Q0puKd2jORvjORckfosOxnVGLOUHkKonA07cqAchpQe4knsk6Aqcn5VBWIv2nbHWQXlftC
	4fGqCcSFSCX5jx1qxrfFipxBDS9ZOlG6qsWRvp0sTQaBfCOvPHFVpWowEfHjBiyF7RePYlwIsFbWE
	da3OjnVpWMlDe4c8iqC8mt934zu9f/n/b4tJPXXTFQJRA3xijrCPMb49KlEddlLcFAwYGGLNvG2/S
	Sg83Z8nnkcNqxA50ZCFa5vNgoQ4Fdh+hZ/NSgRw9ANsw8vUVYP7gkvHvOB7JOID+j4QRwhGUPoSia
	cJkKhgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSC5x-0000000Gztx-2sO7;
	Fri, 12 Jul 2024 08:57:37 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSC5u-0000000GzsF-28jl
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jul 2024 08:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720774639; x=1721379439; i=spasswolf@web.de;
	bh=q818iMHzVBVmVT4CCTpT313nYF1LwDuhQ5Wo0/o9I78=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HYJF8aClPG9Gs4DK7tVi/DfrW95Nyj1KYJIsN8ORTIZKTwGxLYix1I931TO/E4hN
	 JVqTCh3gqQBJG87hmKlN4j+kzvlpnk8PgY3saVP48bmzwA3/C6QYVvZ1AzzSzlG6S
	 ArSt6onXC27X2IAxan6UGekhpIoaDhGzxFazge90BqVWErn9nWXf33VwC2faJ+I7c
	 sEyAtF8B4IHM6YK/p4rs/g6nw1QjuljDkMTEc9Bhb2liiiG8V5y1SJNNP8UY+fPY/
	 wuU4X9SyCzQ89Q9TCjNscznjfkiDlf06OZ3iNHfGacGvfvcrPMjTknWy3Qp/yQoTV
	 CyEYaIPR912Y1m5KxA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mav2X-1rvs4i00AV-00apCg; Fri, 12
 Jul 2024 10:57:19 +0200
Message-ID: <bed2ef069bf991032f95f556b23fc5c8f725d535.camel@web.de>
Subject: Re: patch 46/47 causes NULL pointer deref on mt7921
From: Bert Karwatzki <spasswolf@web.de>
To: Sean Wang <sean.wang@kernel.org>
Cc: deren.wu@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com, 
	mingyen.hsieh@mediatek.com, nbd@nbd.name, sean.wang@mediatek.com
Date: Fri, 12 Jul 2024 10:57:17 +0200
In-Reply-To: <CAGp9LzoXMoAW6dVZjTf-JcD_wiU4yXpGwkLaVyWXTkaV2MOKwg@mail.gmail.com>
References: <20240711175156.4465-1-spasswolf@web.de>
	 <CAGp9LzoXMoAW6dVZjTf-JcD_wiU4yXpGwkLaVyWXTkaV2MOKwg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sIKhldBgcjtPKQWFe/buZTda0sdouDZcp2V6JqwlSh2q62Cho/j
 nlvjuMSklrXtpSk/fLVcwwI9KF1ynsLTvKWUQFlMd7Rto36C5jDKvyehU8kDyn6qcpEJAa8
 tveUAXeqfU3im8TZpo694cEKX3eNq/6EQgCGkKEEjXCCqIRkyeRW7F7nvPTGJGj5TNfSSLO
 XXuFYRxCEBrEYtq80c4Fg==
UI-OutboundReport: notjunk:1;M01:P0:jMP8WPPszMA=;rdREfHQyvwNxa8u0hXghW38V7ot
 eZ9nVu3nHgi5maCFhOMdIF0XryFuMG4PPG9VwU4DnKkJl6m2j8bOFMRdSrgf2iX+b0RYr0nUI
 otQjns3KiVM0+tH6JkyKFAawEPY9Zzf4oznh1u3fa9pIW28OJ0jO0cWdJnG+lvKZXTjoaau6N
 qEUoR+4FQCuENBF1p5/FXZjvwsAb5IWwsVAkyR9RL+u4xWDd0XN4gSSUyeK++U2EObVvelcj+
 Uh1ABbJj7AmdHm70pv+9VSL7Ftc4uWA55xSDHRZ0e3rm9RHkYzTYINvvDYpBqCPOe7YOfDAe5
 0EqFh2DQvf4t5bEKN9UA+5xNoa2N3tWw9GI5+S0HMsbK/z5VharQqpRoyHPe3Rb5Dwcq62pcE
 woN76ppHr8d3JQ2UmnOsEv/r4XV8EREgjzLjt3FxEp2bRgcEelFvL0pODHiAgp0yZ6XQ0aM7N
 JHC5zYIkvCRqWdAaoKXIE23JuXJjQ0gdqeIu4WldD54L5ztQYIeJW1aVZKrb9Mn7+fDNN8P2a
 jP+KG6ZJJ8KpsvMeQ1IPKE3Vhw2WvTdmdzmIxtN5MX+2ge4ooUTRQosD0gYrH39d6qRokibW4
 CZDE++9kF3dS5V51QWR4UYAH4KQUeR5iR9jVTselV5CVAwtuzmG5y3SgDuIoDtw+MP0dLx4kS
 n6P/z2wXneYlZMXN4be3VT0FVvr8mr7HzQ/Pg+QYXePgUWa/XcUyTRzSxwc/MW/bA98bUCUqj
 pvDVqDgvsMDLld0Dg/7lBqlRhCJwOXv4VNMmoRj6SCh+kRovzD1ul6ls+KVnclOwR8Ra7ayJo
 +BfNt4N9j1QaR9ph/EKyrM1A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_015734_860139_E796DCA6 
X-CRM114-Status: GOOD (  11.09  )
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

Am Donnerstag, dem 11.07.2024 um 18:40 -0500 schrieb Sean Wang:
> Hi Bert,
>
> Thanks for the detailed debug log. I've quickly made a change to fix
> the issue. Right now, I can't access the test environment, but I'll
> test it and send it out as soon as possible. Here's the patch.
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> index 2e6268cb06c0..1bab93d049df 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -303,6 +303,7 @@ mt7921_add_interface(struct ieee80211_hw *hw,
> struct ieee80211_vif *vif)
>
>         mvif->bss_conf.mt76.omac_idx =3D mvif->bss_conf.mt76.idx;
>         mvif->phy =3D phy;
> +       mvif->bss_conf.vif =3D mvif;
>         mvif->bss_conf.mt76.band_idx =3D 0;
>         mvif->bss_conf.mt76.wmm_idx =3D mvif->bss_conf.mt76.idx %
> MT76_CONNAC_MAX_WMM_SETS;
>

I tested your patch with linux-next-20240711 where it works fine and with =
linux-
next-20240712 where the mediatek related error are solved, too, but gdm ha=
ngs on
startup (with no related log messages, which I'm sure is a different probl=
em).

Bert Karwatzki

