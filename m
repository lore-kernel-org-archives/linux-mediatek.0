Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98C5C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 18:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oE54+rx3E28RNN81m89+aO2BvQkOWgie8l/8oIwgbIY=; b=4kjo0gCRiuEZXkLdgmAvmK7eYc
	eqDrW5nB6VewXJXtvGG4hufolMtDYZT8aPjahOPWyRuCPv7TXzNlvVpnqaAJTOCRhJGId2KVIzuiR
	dZP2Ii/UlbONRH4Se6sPgfzQ77K50tbLoMQ1qQJcOkYXmxhy4/4dE1RfidrCRXrMqbzNkaskXCwkZ
	8YP4r4gjzfqIitS9hT6/OCWxA39oNyk5H0sgrmlkz132x40tewWOIKOcWHxYIAvQMnnKSLo6CXDvo
	UycTE3LYkp3pUHsL4AbxsrOAqcqFHXbnff23nVptZ8XiKR94tfhLEH/CCqcEntZMEo2RIAcDZ2az2
	iU3uDXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wed3m-000000002Fh-05F4;
	Tue, 30 Jun 2026 18:19:50 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wed3i-000000002F8-0z8v
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 18:19:48 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7e9b7dae39dso2947959a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 11:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782843585; cv=none;
        d=google.com; s=arc-20260327;
        b=i1PTYmtlqqKr/SeNZJzmXyh+FM01JeZOeUI3zUe4KLRlDCT4Z4CMdpCkCxT9CUuyOK
         y8UOmAJIUXQvRuqRjpAeVW2WkVZXYeSmasN8akXG8wBWwEyitr4n0t/xKr2CLoOybBK8
         EmcgoXfz8ofQgCvnDb+wGdJ8fhxt6mwNGPew5T8S+cvgSY5Bcng/QANNLxay6ETSfAd9
         leY6/byL5uYy+k+Z2etSkX+eFVX6IGzLvoq5nEmWFoqRoPm+/uBU8cKIKY0dIzyKk5wp
         GDjFPqwNxjhyQanPKGYvoH/DAG62JJwLkeYc0M40FREr6j90flDXWoU6Avqr5z/MRiOt
         ebuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oE54+rx3E28RNN81m89+aO2BvQkOWgie8l/8oIwgbIY=;
        fh=sfFvrE0ap7ZlUr1gOMEMHnrVhgKOw1muosy8jv4UHbY=;
        b=R6wdNwL/RDa5sSBWh/rLpwOx2DnXOZ7y9UBnLdjqyOzLn1SVIy392VCmT59VT8BP0J
         CDYUW5JfrjW0mKZkePZJhhOdleN7ntxu6EBLngh69h8IaehVeadTOM2PIgBddVpEsbOy
         1Ok/wqEJXdWATPjlV9MPGqYstgvNFykO8Jc19sCYjaoMcdjrYJKFkxUnnBQ+hgSDaBo0
         ci1sEVkUlz/iEdfveqdKOEB60m6XgTZtpAWPn4W/LnrWPaCofenPi+/DpjCwkx53zjVr
         /t2qpWb9mKyzYhPNswHApb3VrF6997vVElMIwj07Wf/ngIcG+A1X47Cv/7Zc0QcHO7sq
         fwXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782843585; x=1783448385; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oE54+rx3E28RNN81m89+aO2BvQkOWgie8l/8oIwgbIY=;
        b=sIaaMXZectnUadWM4VBy04WgCBFLFbDvixDAsijeR27ZRk9mNDwTop82ISCo9iLd1A
         s7EvOWUeGeKoaZ/fu+G2G5o/5PV7Jjm7ZUQUeLkRPn127O9n6bBPBen1hDUPTyL6Cjvl
         RDUxk5xaP7nIzp6TsAnpn1foKlUiHionXYCwP0dN5hxUS4UC8CS2a2FXC5qWNUSzrCd1
         SOmHn2oaWHRJK5MVjeSes+4Z7C6A/WOa+y8WiPmPHt6pEgEEJ/S5fZIZCL+tkbL/030/
         q2mK14478c2mppjb0fKtkRrLKuPwzhwKJ+XTfehD5Bl1/25Wb1b6P2PplGpsnBqHt2Yi
         75Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782843585; x=1783448385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oE54+rx3E28RNN81m89+aO2BvQkOWgie8l/8oIwgbIY=;
        b=SUi9n9+G4J0g+oLSEq7v/yt3kl+ulueDOawElaZlz+8RgTzd4bsmAkyWNq7lFd+KrT
         3kL9g0oAMOQPaQ6d69B4RiFlKFDlsykqivRssOIDOnPKciNzKliKdmgUGqOcTK+ZdTi/
         VgE/iGPLKdBxTVgXWLGmal8wLTQ7HhvCi54RAKBWIHNuwn9eSL/kFcL3VRkZQTau8+We
         jWdUBznTwFc1O9Na5mbhcGQ78VA80TFDu9/MBD25m0u5K+pBI8Maso9QLKrmulC7Rvdm
         XjLOYJ4BTIGbAfPfaNBLQc+5L3lUM+bqIrK3LxB4LDB9H1AP9xs43U4h+Z90J1nv0N0R
         ncUg==
X-Forwarded-Encrypted: i=1; AFNElJ/DvY1RzNk55Rrrcgjrqo3JrTZprcnmcmInK+ODE7QF5sArWNQEeFQGk7a3DcRg/z56IOJukyLEDxDPM0laog==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYR04eLKODyyxkEcsg7hFcufufPDn4PqhIitC1N8QQX3ni5r4C
	9Tir/QeOr/TovWzdFRRN+xBgG+vUTOzRTYvqdLsz1BwKgiWzZt1lGjmgPp+lisWw7rczIBN1xKi
	dgMANb260swKKrCPh+7451T2LBh7FcQM=
X-Gm-Gg: AfdE7clMXHuXLMDIXI8FwkyIgJ+N4uGkq+SYQxmMOZKHnbYkFFYKAlHRPWG4ApUOir0
	WrhD24lbh94FJz+dXpJk3jALjU9mMTHV1jJXh2bjs0DsomCT/Jfk1uzEPf13h6tchDrG8ytX1K8
	qAfBE0T497eg5jb8EyKFgQXHTAO3ulgoeeTQFlwM8oR4/Pnpx4h29O8inJCgNsdpKCkA0tPPl8r
	cLuEbCDoHKZHwdiajOkMucfccr3M+Bnj4wpCMboyW5blWFOW3u/10ZixA4HyKIUJeaPzw8Fajn6
	XrduGM0lNfhthzd+RQ3n15K9DTMVUqDHYQPTyNPqz6bM13+sERkCf5Jc
X-Received: by 2002:a05:6808:8957:b0:489:6bf3:2d54 with SMTP id
 5614622812f47-495eafc3fd5mr3895556b6e.37.1782843585139; Tue, 30 Jun 2026
 11:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260630123539.668776-1-chris.lu@mediatek.com> <20260630123539.668776-2-chris.lu@mediatek.com>
In-Reply-To: <20260630123539.668776-2-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 30 Jun 2026 14:19:33 -0400
X-Gm-Features: AVVi8CckfBlQXS-AvJ4P_5PwELwNv10OM6MlJ2Jz8lbFBi_--zDr5zCfTIMBNcY
Message-ID: <CABBYNZLho7-McDKpFC+AtotGyy7S=SXP-mT30MWBQ8p44oB-1g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] Bluetooth: btmtk: Replace magic numbers with WMT
 packet flag enum
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>, 
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_111947_033589_A68D3157 
X-CRM114-Status: GOOD (  16.72  )
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

Hi Chris,

On Tue, Jun 30, 2026 at 8:35=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> Add BTMTK_WMT_PKT_* enum to represent WMT download packet sequence flags,
> improving code readability. Replace magic numbers (1, 2, 3) in
> btmtk_setup_firmware_79xx() with descriptive enum values:
>
> - BTMTK_WMT_PKT_START (1): First packet of a sequence
> - BTMTK_WMT_PKT_CONTINUE (2): Continuation packet
> - BTMTK_WMT_PKT_END (3): Final packet of a sequence
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
>  drivers/bluetooth/btmtk.c | 6 +++---
>  drivers/bluetooth/btmtk.h | 6 ++++++
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 02a96342e964..21c08ee1cdbf 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -230,12 +230,12 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev,=
 const char *fwname,
>                         while (dl_size > 0) {
>                                 dlen =3D min_t(int, 250, dl_size);
>                                 if (first_block =3D=3D 1) {
> -                                       flag =3D 1;
> +                                       flag =3D BTMTK_WMT_PKT_START;
>                                         first_block =3D 0;
>                                 } else if (dl_size - dlen <=3D 0) {
> -                                       flag =3D 3;
> +                                       flag =3D BTMTK_WMT_PKT_END;
>                                 } else {
> -                                       flag =3D 2;
> +                                       flag =3D BTMTK_WMT_PKT_CONTINUE;
>                                 }
>
>                                 wmt_params.flag =3D flag;
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index c83c24897c95..51c18dde0a80 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -66,6 +66,12 @@ enum {
>         BTMTK_WMT_ON_PROGRESS,
>  };
>
> +enum {
> +       BTMTK_WMT_PKT_START =3D 1,
> +       BTMTK_WMT_PKT_CONTINUE =3D 2,
> +       BTMTK_WMT_PKT_END =3D 3,
> +};
> +
>  struct btmtk_wmt_hdr {
>         u8      dir;
>         u8      op;
> --
> 2.45.2

sashiko has quite a few comments for these changes:

https://sashiko.dev/#/patchset/20260630123539.668776-1-chris.lu%40mediatek.=
com

--=20
Luiz Augusto von Dentz

