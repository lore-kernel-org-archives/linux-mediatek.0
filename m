Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1633D3E77D
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Dec 2025 21:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ET/9QO44rDBP9OpaiN9wAo/Ddh/RnDMf08D3p9at9V0=; b=MW78XC5tI73yH7YLn21mM8qpcB
	mjupnEjMLJzdLzmh579UgICTJjntJ/slC5LFNWMT2uido/XBkfyt5R7k0a+uBOC/iDl787j/cayJK
	6MiDnNyKmuCrwivbjwjKgVk18DkOD9fXdhKhpaDzzj3umISFBk6fHyPzNcMrLIM9LhE7qyptC0OOY
	pFY/17kS7296DXeASLouljHRqbpItSKpcIbbNzGPvCf2N2+8M97sI1+moUJ8w0NRUB2HvGfjicYsR
	QPbwZpW4QidUPBYKBag+s8RANlGnPheNZFSHSyNeoMCnzP7/w8CQf75lv7Tpbh666Bb//YpyQR1jt
	0uPJp1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTRR2-0000000Fszl-37nr;
	Wed, 10 Dec 2025 21:09:20 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTRR0-0000000FszL-1ikD
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Dec 2025 21:09:19 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-37b97e59520so1590481fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Dec 2025 13:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765400956; x=1766005756; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ET/9QO44rDBP9OpaiN9wAo/Ddh/RnDMf08D3p9at9V0=;
        b=hBg97lIa9JlFmEuzFWwqjkSOd8OsTNf4slRrpxb9np/IMCwRxAQWMHbSOoN60lRwlc
         Wz9TAFrKN6sWQAvx8a+T4NZo2SWFoh4N/eAS2NKH60xjLN4By3sZMEW2SatImltzlMSx
         w9WOrVXLc5SRec1T6NuipZ7Gtkn5mhlW5o6HGgfr/0joLrlqpYKzpKRv7y44cpdFRpJW
         EcPjr1NAG1BJLmQojOHmoIlCeuiq0WZiuse5niQZjDVIdrzptKe4yvwc/oq5BD+5sS/w
         F0ai+ArLDA2jGyWCpPV4lVYH6QzcGfv58LXDzkLo35TNczVV14gIX5fKift547NN5hOq
         yIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765400956; x=1766005756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ET/9QO44rDBP9OpaiN9wAo/Ddh/RnDMf08D3p9at9V0=;
        b=AMO3aF8iaWRCmfT32/hbrtnJVMLtpMbw7QAJuKkkETo9bXqDdWY/uk+kK7aEulqhcz
         ZuSP/eTwq1jKg/SW1vW+pljHUe2v0lP4TRVK7PrAhEW8aY/sJ/jrBO56Z0Bp/G18t1fE
         OkLhv/jslP1QEuCgu12ZmV4iyjZ/M2XL6Q7mMDzoIF7T5OWBLb2GAVR9zlUi/OdWnDpj
         3g5YIhviQd7TSajNFq1rshk4G5LxGIz+d1hwwFVl9e/ia9Zxy1e88KqoG12n38XHv4hj
         1rLrBXfyPpClKUYebPi1TjRJl85gxn2Psr3FbjFw1LfWuBSeAkgAhUJQ3gF8HTIJuriS
         u6QA==
X-Forwarded-Encrypted: i=1; AJvYcCXvq+g89n6EV8SGm9rPGc9+4ezz41fnRj0cDYvWDC+K7CCD7ec+cJFqgyhZ2QfceHKmU13xlhPzoPbWkkgrKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+5CmtqnOhTu8lKBlHxrnbheSrXrkD6wHvtrWh7lTLkpsGeb0K
	JyKO1R7RHloA/s8KO9dtn0SqEI6ojCa4WGhIlaxdWL6pM9Lr4ICvGgFCC2l9G1e6YpKuXPl/oGR
	0XIoDdc//qqbpKHisWFzyZN6uIFOOgF8=
X-Gm-Gg: AY/fxX7k0z9Y4XJwOvK4VbmYl+JCboegKD/6/iEbT0Uxf/ZlQswv5FB1zfc5Md3Q4jU
	JJRivqKIkImqRGe/A63hQMwu++TzOPxpmoD1G1Qfxn/HHnIuo29jVz53l9+Dg1thSPCclF5s80M
	FVUcxA8mFVpn969OiCZkS7btlaEIt/k1U9ojPviqOoyTJHxHJZRvdPpwxb4QObGUkscCw8HhKD+
	Jyxv3pBUHER+7AYXP53bCa87azWqqeOYmxtNBp4+tsz/OnoOgiNg1vhpTt+cFIchWwK/Q==
X-Google-Smtp-Source: AGHT+IHdCox96E67zeHTDjL/WO2yGbC6snv7WJvcW8t/0qFT9DOrWg8r9WPmdGrMqw4kUG3QDe03qZMxxZ+Jt9yBp50=
X-Received: by 2002:a05:651c:1505:b0:37b:b8c0:b5d4 with SMTP id
 38308e7fff4ca-37fb208c3bfmr10569841fa.23.1765400955319; Wed, 10 Dec 2025
 13:09:15 -0800 (PST)
MIME-Version: 1.0
References: <20251209120559.2991698-1-chris.lu@mediatek.com>
In-Reply-To: <20251209120559.2991698-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 10 Dec 2025 16:09:03 -0500
X-Gm-Features: AQt7F2pUKepbtCaHCSB5Wq10ueXFl0KdG1dLSST2gFITkH7g0XHmlMzylb_0RLQ
Message-ID: <CABBYNZ+o_ewu7fwDLSW0c4BEosG-CqugK+7JgY3TBf2PcPrm8A@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: btmtk: Trigger reset on firmware download failure
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>, 
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_130918_471482_7902B708 
X-CRM114-Status: GOOD (  22.29  )
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

On Tue, Dec 9, 2025 at 7:06=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wro=
te:
>
> Initiate reset flow if MT79xx series BT failed to download firmware when
> doing setup.
> If driver is not able to get event after reset in the first section of
> btmtk_usb_setup, the protocol is deemed unuable and driver will return to
> prevent from repeatedly executing resets.
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>  drivers/bluetooth/btmtk.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index a8c520dc09e1..8b1443b9e9cf 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -1333,7 +1333,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>                                                 btmtk_usb_hci_wmt_sync);
>                 if (err < 0) {
>                         bt_dev_err(hdev, "Failed to set up firmware (%d)"=
, err);
> -                       return err;
> +                       goto reset_fw;
>                 }
>
>                 /* It's Device EndPoint Reset Option Register */
> @@ -1353,7 +1353,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>                 err =3D btmtk_usb_hci_wmt_sync(hdev, &wmt_params);
>                 if (err < 0) {
>                         bt_dev_err(hdev, "Failed to send wmt func ctrl (%=
d)", err);
> -                       return err;
> +                       goto reset_fw;
>                 }
>
>                 hci_set_msft_opcode(hdev, 0xFD30);
> @@ -1444,6 +1444,13 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>         }
>         kfree_skb(skb);
>
> +reset_fw:
> +       if (btmtk_data->reset_sync) {
> +               bt_dev_err(hdev, "Mediatek do firmware reset");

This message is a bit cryptic to me, why do we need to print that you
will be doing a reset?

> +               btmtk_reset_sync(hdev);

This seems to be doing a hard reset, which I assume you are doing as
an attempt to recover by retrying to setup, but if it fails we may go
into a loop condition trying to setup so we better limit the number of
attempts.

> +               return err;
> +       }
> +
>  done:
>         rettime =3D ktime_get();
>         delta =3D ktime_sub(rettime, calltime);
> --
> 2.45.2
>


--=20
Luiz Augusto von Dentz

