Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4F2FED3FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2026 19:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xw0ah93fqgdCasT1Yd1P/eO3pcya9SWmHCEVOlySNwM=; b=mKxFBegjlgHqvpo8Ai9PkZkwAi
	8r6rAjdIplqIm635hCFy1QLVyoIAE821qybHnmDUGx8K2uXbX2cBmxcOaT3wX0zMLJLTVc26eo+s+
	PynfuLDM5UkAUuuf+2oP1UaOTGKqlYz2QXwUGfDRX23LOWNLpqAjhlEOzrWh3oD9nyoT1GYKfwOfR
	5uXUjbcxPP8gHuH2/a6zJllOZXGb9wvCLinVrn/Of5uE18vCMWbRcvYdDEHDbFivTTVV4sEhyPT3b
	KI/v3xtTU7HzuI4z8BMeqc4tpEA9mqg3VUbsm57GB771cSKSynzOPqi8ZoiUunKRAywMd/xSwH9uQ
	Hkd1SFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMVY-0000000DiNU-1DGI;
	Fri, 24 Apr 2026 19:48:12 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMVV-0000000DiN8-3o0h
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Apr 2026 19:48:11 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-651cfaa21e6so7569011d50.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Apr 2026 12:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777060089; cv=none;
        d=google.com; s=arc-20240605;
        b=brtgIVn12KoYmrwa88O5R66wAICpnA3yKn+RtVYuUE69lwpR5tnfm8wpE6TG0IOhjA
         AudGj+bKDMoDo4Y20o2stNbLKYEpMwGP+fsSZhZk2ebeiu3BqlKjJys+ci4i0Rv0hhSO
         6OCUvuHaOmL29+LOa/y1h9X1gVlmZIhxem9gv9OsutfuCtRfC2Ah2H0iTH7gckRJzLuQ
         ADFC1NowpPzXslpsf9fwuB6yw2V7TW8zmwU29+UYL89lDWIDBLXWzXO8QKOOuHoLqw8n
         JDY7DLroHwlRbIRI6zYn1UwwKIAC/njUktQaPl7pUyOikEE5lKVkzB+RNN4K0BI3F6Jf
         ScqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xw0ah93fqgdCasT1Yd1P/eO3pcya9SWmHCEVOlySNwM=;
        fh=kdfCNUc+fiiS37y7AIMuY0DESw3f3o5M8wu7CDApnao=;
        b=I3RXs0uNNkYjMEdBW4jV5SIMMwNWhSbEF2jChlGfcq7p36bPYp29Yql8vP3Jhpg7B/
         FLZRYB1xKIdQWurDRWjER0Lk9C9B9+SZfAmRocNFQ9/MRG3qOWl5uIXfz7/VI9pUsXoc
         ShHaJC8uviQZR84HIgaOR8g0EdYeNRsgU4jk2jENzxzScAkeMlKOB6OEyvBF4mj8zwzS
         yopdw9YgjCB6/cCvL6L9X2mnJ3b5Cc610ehWeC2aar8X990cXHxmstQ4285Jq8wgyhS5
         0rMoA/UoVokJy0gS9ZkpOxOvHG03YdrIv6AgJoLwPOZ9elC58REhNT6FBZAhEYu4uyDP
         PW7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777060089; x=1777664889; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw0ah93fqgdCasT1Yd1P/eO3pcya9SWmHCEVOlySNwM=;
        b=keHBUOVfYCdKXGwdcOGcyV0Hsfvb0CPUf0z47SsDK/rq99CoHgZtfmFqnKAh3bDIV3
         mU+kzoXq76q0UXllAczc5/4NiUcy3I4TnyjUA6ApZItGtbCF1CtGMrH4weD+bkNU54jl
         4wDbcQsd3H6IfwClKp3Ei9LXtX1D3cnM0r8A8HgzrD+ziw7bmFr457h2sn+5n54vC6O/
         63XxWt0Wa1xjw2xmbL8U3uTrE4w+bzf4KNQAje/hxDE0tzNzeDFKTJV/3x818yHzWzo4
         dSPgM7aoSqIQhgJZXxuwylUG0Wq9uhjyp5sbvwscS7uOr/JQ5UPjlutfbbDHynz343yz
         gKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777060089; x=1777664889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xw0ah93fqgdCasT1Yd1P/eO3pcya9SWmHCEVOlySNwM=;
        b=DOXBoO8RwJd105ujqsxiidQ/74VF4c8KPsGISl53gXI77o9QQhiYQAfVOB5n7kS0iv
         fmUcAEzJWJCYAeVHSO1PDdwseILmyHaXbH9I1Z35nMcU0oBNoJq17pufsN6nxLuVwYdG
         MXHCaFDld0jxIxVjBXVM8qOWOZ0AW+1gUXGrE6xN1SHMWVPjRTSogUOdNgrYmRMTPTzU
         kpNGhyZ60F00S3xi1k2qoSUte83m0KRyyXP387edEI/wNHV5wOxrTmcKwozvLLKgvE4X
         Qmhep+ZzSnzliiElJ1nEGpypg6uJmJA6h+6SWsF3FeHEC3vUDFJO3wHzzf8MCgjXnHNW
         WTCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SfnlZIHq1cqo4wRbau4StqPJ33Kee6ECEPM+G2J5YM/BupvpJepM8R5d/MgDF27Mu6O8HnNbraOvmiIiEdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmyUBX+Fte1xQEHkPvtuP6t7zPkAGeP3m2vJ/sL+FfRO0hgXmy
	Pnvk+GLMBBS+RbAt/AW/xuIqyac/WQiVAhOw3Sr5ZPPOZ4Zvi4pzxE6EuHBfAVSp2oUSDgC52O5
	2Zo1ztkm25Lcx+/PZoFH2Rzv1Cts54NAJOXv2
X-Gm-Gg: AeBDieuTqCqm1rypdH5LpQjtP96h5lPci0HH8ft2WAdVlEnqUuvOJ2Jr5ZDfVy0zBsz
	IM7YALEnFojqsnlqYD3l9iXqM7DuyQuY2HCwe7AE2M2N0nCI0ReK/hPhhQzXz/NSC+r04kCYgmR
	elXZZ5duDFRBJUjYb9Ie3nR0T2OUZMJyI/gI3Eat3H1RODbCaWwFKFwbBEHq7cFqIuTRyLDxwxk
	rztl1MrjeEfwj2pJQ5bKVv0R3QcV/rbOcAyB6owuKTiHeVXYlM3Z9mOv0JO568FoFQDDVSN/BxU
	E9BQnpB9wPL7L4XWAVtQlLB6zGpIJMWF0/hJV4zzXKmIYhm6CXL32sehFa1M22LunsL3aDseQY3
	gslgo
X-Received: by 2002:a53:5a04:0:b0:654:3fdc:7b3d with SMTP id
 956f58d0204a3-6543fdc80e1mr9099899d50.29.1777060088707; Fri, 24 Apr 2026
 12:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <d5d33658e20fc0ad4cfe80df185d31fecad66fcf.1777059145.git.pav@iki.fi>
In-Reply-To: <d5d33658e20fc0ad4cfe80df185d31fecad66fcf.1777059145.git.pav@iki.fi>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 24 Apr 2026 15:47:57 -0400
X-Gm-Features: AQROBzDL_PBFs8AHw7GMhRRIhw96Y_bVsgI1r1Ck3GapL7tmfsia333VJnyPspU
Message-ID: <CABBYNZ+DhKq9_1kW0Xt6NgDPjMnAVjNXs+DPk-zbVFkhfDR9Uw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: deal with MT7925 invalid ISO RX packets
To: Pauli Virtanen <pav@iki.fi>
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_124809_956494_0007088D 
X-CRM114-Status: GOOD (  20.45  )
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

Hi Pauli,

On Fri, Apr 24, 2026 at 3:38=E2=80=AFPM Pauli Virtanen <pav@iki.fi> wrote:
>
> MT7925 produces empty ISO packets for Handle 0 when RX is active:
>
>   > ISO Data RX: Handle 0 SN 36734 flags 0x00 dlen 0 slen 58  #851 [hci0]
>   > ISO Data RX: Handle 0 SN 36734 flags 0x00 dlen 0 slen 58  #852 [hci0]
>
> The driver should filter these out before passing to hci_core, otherwise
> it will printk "Bluetooth: hci0: ISO packet for unknown connection
> handle 0" errors.

Aren't these rate limited though?

>
> Filter out by adding hdev->classify_pkt_type
>
> Signed-off-by: Pauli Virtanen <pav@iki.fi>
> ---
>  drivers/bluetooth/btmtk.c | 13 +++++++++++++
>  drivers/bluetooth/btmtk.h |  8 ++++++++
>  drivers/bluetooth/btusb.c |  1 +
>  3 files changed, 22 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index ab34f1dd42bc..9ba58cc9720a 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -1568,6 +1568,19 @@ int btmtk_recv_event(struct hci_dev *hdev, struct =
sk_buff *skb)
>         return hci_recv_frame(hdev, skb);
>  }
>  EXPORT_SYMBOL_GPL(btmtk_recv_event);
> +
> +u8 btmtk_classify_pkt_type(struct hci_dev *hdev, struct sk_buff *skb)
> +{
> +       /* MT7925 spams invalid ISO packets during ISO RX */
> +       if (hci_skb_pkt_type(skb) =3D=3D HCI_ISODATA_PKT &&
> +           skb->len =3D=3D sizeof(struct hci_iso_hdr) &&
> +           hci_iso_hdr(skb)->handle =3D=3D 0 &&
> +           hci_iso_hdr(skb)->dlen =3D=3D 0)
> +               return HCI_DIAG_PKT;

Not really following you here, why would marking it as a diagnostic
packet make it any better? In fact I do think this needs to print
something to the output if the firmware generates spurious packets and
have it fixed in the firmware asap, silently discarding the packets
just makes the issue undetectable, which I don't think really helps
users.

> +
> +       return hci_skb_pkt_type(skb);
> +}
> +EXPORT_SYMBOL_GPL(btmtk_classify_pkt_type);
>  #endif
>
>  MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index c83c24897c95..e573b21cecf7 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -222,6 +222,8 @@ int btmtk_usb_setup(struct hci_dev *hdev);
>  int btmtk_usb_shutdown(struct hci_dev *hdev);
>
>  int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb);
> +
> +u8 btmtk_classify_pkt_type(struct hci_dev *hdev, struct sk_buff *skb);
>  #else
>
>  static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
> @@ -306,4 +308,10 @@ static inline int btmtk_recv_event(struct hci_dev *h=
dev, struct sk_buff *skb)
>  {
>         return hci_recv_frame(hdev, skb);
>  }
> +
> +static inline u8 btmtk_classify_pkt_type(struct hci_dev *hdev,
> +                                        struct sk_buff *skb)
> +{
> +       return hci_skb_pkt_type(skb);
> +}
>  #endif
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index a0a7da498466..7479928eec4b 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -4245,6 +4245,7 @@ static int btusb_probe(struct usb_interface *intf,
>                 hdev->reset =3D btmtk_reset_sync;
>                 hdev->set_bdaddr =3D btmtk_set_bdaddr;
>                 hdev->send =3D btusb_send_frame_mtk;
> +               hdev->classify_pkt_type =3D btmtk_classify_pkt_type;
>                 hci_set_quirk(hdev, HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_=
CONN);
>                 hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
>                 data->recv_acl =3D btmtk_usb_recv_acl;
> --
> 2.53.0
>
>


--=20
Luiz Augusto von Dentz

