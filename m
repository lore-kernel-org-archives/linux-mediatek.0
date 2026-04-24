Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D231FF8850
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2026 21:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjESLQGGDSCXYFLITpg3KKFAygdIErg/Cn3vUT2i1iQ=; b=hAxeTWC0e7VhmaxmwxrLLNwPXH
	sqgScJe1hjHVVFbcfeRxaTwKvoBNBaqr8JkeAFJzyE+jDYxjkUUmzEK/kKWweoOpDo3nkorz0yspN
	zwbKm5H0XxeZ2XiqX0bI6QV6ahUOg1HmFNg4VgCJvyMzKESNoPivxJK98Fl0U52UWE6/9nitY/nKq
	5Q/t+PcQ/DRYD0UYw3Ka4fHfBkpLy16pA5zcDcWEUeCRNnkmjpI0KaaKfEtp71rYapVT4S15NS6NE
	jQymk4V9FbX/TUhJqM+XRVqjaUmdaTg9tIxGK7ZB3c4V2/0sLVSEx9wCRPP7kY759mUp33u1LI7FU
	DOjuvAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGNp8-0000000DlFM-1YWw;
	Fri, 24 Apr 2026 21:12:30 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGNp6-0000000DlEy-001A
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Apr 2026 21:12:29 +0000
Received: from [10.73.197.129] (unknown [193.138.7.192])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav@iki.fi)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4g2QdZ1vrvz49PtJ;
	Sat, 25 Apr 2026 00:12:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1777065139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjESLQGGDSCXYFLITpg3KKFAygdIErg/Cn3vUT2i1iQ=;
	b=fMK7vv/HBj2gFZT85Yp/rjCXFSt0jkp94c8HMt315bVT7tIX7WQIV+rphBw/YKq6KTZGAw
	v2s2Gz/+krvk3P3hQfDhRPtyaAH4PJiWQawEmOdoH/pLACBgZnibBZeFYarQxpZmQB4uF2
	KtTXIxa+tk4MDYxfymF2v/KM7MYygFs+BTggdpKA5offupqeITYI+054IbHVh+C7leinjs
	EzPBR0iP/MB9q7vNdPgwLdfl6BpomAvkoVIyCTxR+5+1ELvqW++rDxxzS/2TogDpYbOk8k
	wv+vS476/N58PqZiLkpzSRwydch8qYzwwt0ubx+3z1kO+4OQLpaZJoV0QbSTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1777065139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjESLQGGDSCXYFLITpg3KKFAygdIErg/Cn3vUT2i1iQ=;
	b=EeO3FvIPFKLLPVgOvzb66g2ZeHGM1frq+Mr5qCM7gbpDM4KFuGeAJ55a00pomGEkg51YB0
	rWMLBCFPioO1OtXwRKqMIYsYq/dDDAihOVjT2Ru002MU5ooRGIjyUv38YL/Zefa9mm0EYl
	v2lFC1Fy2cnGCDKZwqrCQGaWd9t8vFBdLFqui0nLAUo8FH2e1X1gv1PrEVZF/ZAVJ1+zJi
	XrdcKhvyAH2gLBUY9IPjBnETBjb+PkLkEtclgoNgar3993PyYKRkN6AmIMjOdk4hRU1gh3
	DkkWbnuR9WZ+tT8fv6imM+i5nr7WL/d1UrC+itD2EawlosTw6z9NVCqtbfWqBw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav@iki.fi smtp.mailfrom=pav@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1777065139;
	b=pVTUN07Nn1feI9LEL3qbyRdyd9fp06GXyJiRTwSpZjnzK/LQxOrqdY2yiKMfkYyBlBoP4e
	X5MbUGvooY90MMcxWhjH2joRcpHL32LM9zNGyI6S/h4TfXsT6Yo7fUQ7X7J/iMOfwhS3sE
	QFGVnshtl3sgxfHwsuqlYh9D8mlgRTq7P+CMKlk8YSvfjTbLCjKzg6Wg7BMYRmKBLMIvra
	d69HMFWtaxZgNIBRf2FTff85mDiFKXd5q35exFz3nzR6gIN44r6QfTBcUUNq+1zz1hD44+
	xv2xauKTd11UkXx1pBIDosH/+bpKEcetFY+bmFHm4uwnZsvmp2I0Mcf0MJ3F7A==
Message-ID: <9aa316a561086294bdb4932241d96e1cd1d913cc.camel@iki.fi>
Subject: Re: [PATCH] Bluetooth: btusb: deal with MT7925 invalid ISO RX
 packets
From: Pauli Virtanen <pav@iki.fi>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek
	 <linux-mediatek@lists.infradead.org>
Date: Sat, 25 Apr 2026 00:11:55 +0300
In-Reply-To: <CABBYNZ+DhKq9_1kW0Xt6NgDPjMnAVjNXs+DPk-zbVFkhfDR9Uw@mail.gmail.com>
References: <d5d33658e20fc0ad4cfe80df185d31fecad66fcf.1777059145.git.pav@iki.fi>
	 <CABBYNZ+DhKq9_1kW0Xt6NgDPjMnAVjNXs+DPk-zbVFkhfDR9Uw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.0 (3.60.0-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_141228_385951_D93FD7DE 
X-CRM114-Status: GOOD (  24.48  )
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

Hi Luiz,

pe, 2026-04-24 kello 15:47 -0400, Luiz Augusto von Dentz kirjoitti:
> On Fri, Apr 24, 2026 at 3:38=E2=80=AFPM Pauli Virtanen <pav@iki.fi> wrote=
:
> >=20
> > MT7925 produces empty ISO packets for Handle 0 when RX is active:
> >=20
> >   > ISO Data RX: Handle 0 SN 36734 flags 0x00 dlen 0 slen 58  #851 [hci=
0]
> >   > ISO Data RX: Handle 0 SN 36734 flags 0x00 dlen 0 slen 58  #852 [hci=
0]
> >=20
> > The driver should filter these out before passing to hci_core, otherwis=
e
> > it will printk "Bluetooth: hci0: ISO packet for unknown connection
> > handle 0" errors.
>=20
> Aren't these rate limited though?

They are rate limited, yes, but it's still 10 messages every 5 seconds
while RX is active.

These are generated at a fairly high rate, something like ~60 such
packets per each valid ISO packet, so I agree this looks like some
firmware or driver bug.

btmtk has some custom USB code for ISO RX, btmtk_recv_isopkt(), that's
maybe one suspicious place to check.

> > Filter out by adding hdev->classify_pkt_type
> >=20
> > Signed-off-by: Pauli Virtanen <pav@iki.fi>
> > ---
> >  drivers/bluetooth/btmtk.c | 13 +++++++++++++
> >  drivers/bluetooth/btmtk.h |  8 ++++++++
> >  drivers/bluetooth/btusb.c |  1 +
> >  3 files changed, 22 insertions(+)
> >=20
> > diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> > index ab34f1dd42bc..9ba58cc9720a 100644
> > --- a/drivers/bluetooth/btmtk.c
> > +++ b/drivers/bluetooth/btmtk.c
> > @@ -1568,6 +1568,19 @@ int btmtk_recv_event(struct hci_dev *hdev, struc=
t sk_buff *skb)
> >         return hci_recv_frame(hdev, skb);
> >  }
> >  EXPORT_SYMBOL_GPL(btmtk_recv_event);
> > +
> > +u8 btmtk_classify_pkt_type(struct hci_dev *hdev, struct sk_buff *skb)
> > +{
> > +       /* MT7925 spams invalid ISO packets during ISO RX */
> > +       if (hci_skb_pkt_type(skb) =3D=3D HCI_ISODATA_PKT &&
> > +           skb->len =3D=3D sizeof(struct hci_iso_hdr) &&
> > +           hci_iso_hdr(skb)->handle =3D=3D 0 &&
> > +           hci_iso_hdr(skb)->dlen =3D=3D 0)
> > +               return HCI_DIAG_PKT;
>=20
> Not really following you here, why would marking it as a diagnostic
> packet make it any better? In fact I do think this needs to print
> something to the output if the firmware generates spurious packets and
> have it fixed in the firmware asap, silently discarding the packets
> just makes the issue undetectable, which I don't think really helps
> users.

The motivation is to not spam user logs with=C2=A0error messages they can d=
o
nothing about. I guess we could eg. emit an error only on the first
such packet.

Maybe it's better to first make sure the issue is not in the driver,
though.

> > +
> > +       return hci_skb_pkt_type(skb);
> > +}
> > +EXPORT_SYMBOL_GPL(btmtk_classify_pkt_type);
> >  #endif
> >=20
> >  MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
> > diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> > index c83c24897c95..e573b21cecf7 100644
> > --- a/drivers/bluetooth/btmtk.h
> > +++ b/drivers/bluetooth/btmtk.h
> > @@ -222,6 +222,8 @@ int btmtk_usb_setup(struct hci_dev *hdev);
> >  int btmtk_usb_shutdown(struct hci_dev *hdev);
> >=20
> >  int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb);
> > +
> > +u8 btmtk_classify_pkt_type(struct hci_dev *hdev, struct sk_buff *skb);
> >  #else
> >=20
> >  static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
> > @@ -306,4 +308,10 @@ static inline int btmtk_recv_event(struct hci_dev =
*hdev, struct sk_buff *skb)
> >  {
> >         return hci_recv_frame(hdev, skb);
> >  }
> > +
> > +static inline u8 btmtk_classify_pkt_type(struct hci_dev *hdev,
> > +                                        struct sk_buff *skb)
> > +{
> > +       return hci_skb_pkt_type(skb);
> > +}
> >  #endif
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index a0a7da498466..7479928eec4b 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -4245,6 +4245,7 @@ static int btusb_probe(struct usb_interface *intf=
,
> >                 hdev->reset =3D btmtk_reset_sync;
> >                 hdev->set_bdaddr =3D btmtk_set_bdaddr;
> >                 hdev->send =3D btusb_send_frame_mtk;
> > +               hdev->classify_pkt_type =3D btmtk_classify_pkt_type;
> >                 hci_set_quirk(hdev, HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYN=
C_CONN);
> >                 hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
> >                 data->recv_acl =3D btmtk_usb_recv_acl;
> > --
> > 2.53.0
> >=20
> >=20
>=20

--=20
Pauli Virtanen

