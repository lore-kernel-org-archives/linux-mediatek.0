Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3335C88E45
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=253PUwIF2lUbExbnq4pn03NFxabLUx1bSqL243QpTlU=; b=ZLeojz6ixvZYqOqHLUjoyWBsHa
	tF0sVxwGSz5FEv1ViiQo6gQ6HnjMaMKjkdf5vTYHHpaQOj0dfb5CU6V3+cX2ZfRQptA2CrCJP1gzM
	jqJ+R2BzHgOf3zbmW9M3Ecf0G+YnvRzmB1aoWWhOUL3NGqfQTFOx2CALGi76bq+GgWY8Vvusx4RYK
	o7hRXYGPqIIaaRO21u7HdS78rBeBWhpNrQ+Juu3YURoCB7qLNm5Z7YwKK7OUtNdurolu/INFtlkTa
	c6v2x+06TECvE7YYFrZi01EcMSWn1lEb8jRUbEkefz7apFLeIbyu/zLeSK48MbGsuKAlM87FgFaP/
	rFfY7LCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52KN-0000000GvY3-1tbT;
	Fri, 11 Sep 2026 14:34:07 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52KG-0000000GvWR-3mNw
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 14:34:05 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d46e4cdcaso7103367b3.3
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2026 07:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789137239; cv=none;
        d=google.com; s=arc-20260327;
        b=Jd1cbpwt/133Lt9uMVWqQgRts/YhZ+nwldY83GdUi5cWEbGhC94QRMpUhfcqPz0J4L
         rb5SKv7ydDGOcxBXBnyarrJZ3J76SPgznRQYo3hz6vE8hQMIRT9RqdhnYJUH7nF1jijR
         iyDz2KPMt0o0mGH2GnI1L6DolqN4yevFgG10bOQ2Fg7fZFKQZEckUggiZnDPzFzX2RwW
         qxlEXBafwf+usziuV9qP8XvbrK1COOSgO5gJDCAUnn5gCGQ2v0oaIFgDujG+CE7qAp6l
         fgVNBhEKP9Or+nnpKEbx8J9qt4wA20fPRUh0X31cKNDDWpp1tsXHRHRQT/EbePs0QBtA
         MqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=253PUwIF2lUbExbnq4pn03NFxabLUx1bSqL243QpTlU=;
        fh=O4GFnu2hudKa/WjPDo3vQs68m6eV+vdE/rHC/x07DsU=;
        b=L8yT7zZpDNLDG7ZhyVDnCWIsM6Obh6y8xHZTeCEVa2NGJ17Pb1FIhKxVAwLh23ORV7
         IId+ieWFCXsY9008I/dHDb9uZ0j3j7o4uTlUm3Zp3C3dpM+y2eB89KlZ275A31QsNXB4
         KDNlq6ZphTAdKMnNjseUs24AquiKDk5SGMhHtgceq2ennBGt89KJsQ+zXso8MywwGZb6
         TQ9mtkNIA/KW/s+vPGvwCOCIA8g4O3iaeUscOW/pZsOd/iJp/xRL0POF2UL+bRc+H0kO
         GfZEo5Xz8yt+yETlt26vtFm3pX8giw51JfMlejAXoprNTP22rLmP38q7auxGwnqPAN1L
         Qwhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137239; x=1789742039; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=253PUwIF2lUbExbnq4pn03NFxabLUx1bSqL243QpTlU=;
        b=RLflQZ/OO3VIxxjGwEk3lH6rtHbeSeyddGM4wkV0ufqyFRExqZAe0GjXPeNMKnU1+Z
         Io6DjYeLqbGJ+GPP3Ctrlz3Xd574N2CKU4AGx1+tCzYkiNhlzRXW6OvdNziAzgOk8iDE
         rfkq6EsEFWWcjazzuo+XHAVK4a0I9vOjsBlbG+fnqyQfYrew7D1VoVtNCUmdc/6Lbs9b
         UMpCS6GrgepmDjYHNp7wXKKK2Vkytg6t+o5RXWMYSM+IgOmP9nE96fJJdeo55GvBIbNE
         woMmAauwgmw02grWXN70Ik49RzdlXG+2zFTuLCv9jaJ3D6BBTpW5gGdgPa3s+g7aqibZ
         +JqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137239; x=1789742039;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=253PUwIF2lUbExbnq4pn03NFxabLUx1bSqL243QpTlU=;
        b=DGl98ze0eqawEsVWEyuojpRS85jHbl8zq+a3Dc33RubbzUqc9LpOGmfX+HxcjVWjo7
         GKwtxZkN4OP0FhSmTIrcMcbamVQrRNbzfN0lhf1u+Fp45CIPl76cscZ19URE9DDOgtgs
         B8h7OQLIrvoHLdfmWlzXgwlK+JWNdjmtE83/rjXCUbvaI+oKK8JlO51dIBQl0ufAsLfK
         kQ2jS9j6h+VVmejpAqU+bnO6UlQFvU0XGebqTjMzjsbd5wLLS/ajB1mz+4++hOvb+OjD
         YG/vNtGvsKEPwJ8gRPxZxvAdl0spXENdBdMON+urL7FR1obBMs7KW7eujRJllwj9kJKQ
         DslA==
X-Forwarded-Encrypted: i=1; AKwUvBySBnwGEOnMXNOBbJk1wafVlOF11BWXyRRiilJb/QWAZ03tOPkWjBYehqPrZtYRVfMen444Oc/hbR+3Nj8rLQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mtPeR3RX38RynIZDt0PaLiSUJLPdwidO5ifJE1giOkkkiK/kXS
	swg9ztPi3nXzsd9zK+reKgTxbU+52udKqElq6xDw6akfyTUbx5Kk03coiLPM4Daf1lEzZ3MmY3P
	8BzKgl8esAMruCdu9PWsNzLorRbtqzyE=
X-Gm-Gg: AYBFou39U0saN+aQZqudsSvebwgdibqLLjHVKEg3Iw88XG2w4onW4+57Z6tf12DIEO1
	LEmaNHoIRV8t51uo82m1Ji/BIHEJfDK85taoktdLhKPMarJfnv+zxtF8M3EFBylrmd775k3uOz6
	s5ufx8MEMQLSJWWAlfzJByjw3+jhC+VtdFhXlz/xjEBLC754CmVrs0jRC33NrzHPsfw48qrbl35
	rLqY19GGIDGExstyMfvzsBqBeRD2yZs4VZMRZUEccngazBmVoPasbcFjdGk0pbXrYmCPxTCJ64w
	6ctXIIlstmAUspRBDMNHrS2vqF6b1k6VoK8us5Dn8yvoPnqkaNvqcOPm5atO532q3tXbyb1iLp0
	uIpt1L6JlRK0pPLMOleD3Yufv8hHhOqar4kLWF18=
X-Received: by 2002:a05:690c:d94:b0:854:27c3:5cd8 with SMTP id
 00721157ae682-884b387a6ecmr19566477b3.27.1789137239315; Fri, 11 Sep 2026
 07:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260911104234.2276126-1-chris.lu@mediatek.com>
In-Reply-To: <20260911104234.2276126-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 11 Sep 2026 10:33:48 -0400
X-Gm-Features: AcwNN1VOio-kJ1e73tLJ7cg4_i84qUwIWDri4lPL6COQQRrdpvIJBVG3J4WPA50
Message-ID: <CABBYNZ+SD=KAyMwGf_cBZARONqXhjTg2O-r5FHTqUyMrsprZMQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Bluetooth: btmtk: firmware debug event routing and
 WMT FUNC_CTRL status fixes
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>, 
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_073400_957327_BC5C08C7 
X-CRM114-Status: GOOD (  21.16  )
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

On Fri, Sep 11, 2026 at 6:42=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> This series bundles three independent MediaTek Bluetooth driver fixes:
>
> Patch 1 is a resend of a fix submitted on 25 Aug 2026
> ("Bluetooth: btmtk: Route firmware debug event to the diag channel")
> that received no review feedback. There are no code changes since
> that submission; resending it alongside the two related fixes below.
>
> Patches 2-3 fix how btmtk_usb_hci_wmt_sync() (and its btmtksdio.c /
> btmtkuart.c counterparts) interpret a WMT FUNC_CTRL event that carries
> only the WMT header and no trailing 2-byte status word. Such an event
> is a normal firmware ack for a plain enable/disable request, with the
> result carried in the header's own flag byte, not a failure as the
> current code assumes:
>
>   - Patch 2 fixes this for btmtk.c, where a bounds check already
>     existed (added by e3ac0d9f1a20) but defaulted to the wrong
>     result.
>   - Patch 3 applies the same fix to btmtksdio.c and btmtkuart.c, which
>     never had a bounds check for this event at all and read 2 bytes
>     past the end of the received SKB whenever firmware sent the short
>     form. While there, it also adds the missing base WMT header length
>     check that btmtk.c already has (skb_pull_data() before touching
>     wmt_evt->whdr.op), since these two files were unconditionally
>     dereferencing that field with no length validation at all.
>
> Chris Lu (3):
>   Bluetooth: btmtk: Route firmware debug event to the diag channel
>   Bluetooth: btmtk: fix wrong status for short WMT FUNC_CTRL events
>   Bluetooth: btmtksdio, btmtkuart: validate WMT event length before
>     struct access
>
>  drivers/bluetooth/btmtk.c     |  8 +++++++-
>  drivers/bluetooth/btmtksdio.c | 20 +++++++++++++++++++-
>  drivers/bluetooth/btmtkuart.c | 19 ++++++++++++++++++-
>  3 files changed, 44 insertions(+), 3 deletions(-)
>
> --
> 2.45.2

Sashiko flagged a problem regarding the usage of ACL connection handle
without masking the PB field:

https://sashiko.dev/#/patchset/20260911104234.2276126-1-chris.lu%40mediatek=
.com

If the HCI fragmentation doesn't apply to these handles, please add a
comment regarding it; otherwise, users like Sashiko will keep flagging
it going forward.


--=20
Luiz Augusto von Dentz

