Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AE2C54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 17:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MSfhN/NQZOIItlwojG0mAkCuXdrYw27j66qhC9GXU0o=; b=q/VA0+rS+DngrU2JvjNTsZl82J
	4etEyqouDQbgOlVa2l/AX+xOidVvsememFntBmdKUi6XqmrVoj35jiJD82ng9O2LoJibFdd/H9ZYQ
	k1iToVjV+zKvnJX15gjS3nD6qDTP7JqcR1FP23E7mAL6ehr3QwHPZYpQlDzTVubdweYO6lqP4xSl9
	nFHt2kkUcO7QhgbiIxNvHEzsRCGPtKCMBAJV0oyyLCrOCIqPMNqeSr6DNnVGjvy8wybVLNIu0xVlk
	KFSA3EnZAuuDL3xSxRBBpKzHsqYlMmOgzWSyFJLx+xNFVl5tcNavzkQM86Gn3Xl0hk1oIiAy/Cgl2
	OHSkvVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXth-004WOz-A7; Mon, 30 Jan 2023 17:24:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXqA-004UVH-Tb
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 17:21:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso3711740wms.5
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 09:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSfhN/NQZOIItlwojG0mAkCuXdrYw27j66qhC9GXU0o=;
        b=dnSC9l/Qp7X43K3yBcAlLZrYOY9wqLGfqKQZ//dxhTLjaF9wKAJieVr/Emam+FADKx
         m+rzXLRUOL+iyb3oeXgHNRqcsO2eHu3/FSTbiUWSrJcHfx0pWz7tB90HjKMvIwP6pfw9
         BgmxbRuZQ3v4tn9fmNrLyEFN69UPnOrGz4OkvMFrZLX1TP8k6PkvXcrZYVi12emR595C
         tW95vsGKEBhzd/PVNble1uuOnReFuZwioybK4vaWmZIBuVojZBDs2j/1Sn+U2bp6w0gl
         6+UmKI2TRY9Uh7KXC48xupGsPUXjuE05byEgluhJOubvIjRb9w25SqVnX+rJbDvQpbU6
         hI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MSfhN/NQZOIItlwojG0mAkCuXdrYw27j66qhC9GXU0o=;
        b=t2JFOiQ6cigEZt2hEscTCZ/honvZD6tq3X3jQMgvRWdzeIu9Rox61do9zVEBic4PFP
         DhMs0D/M+dN4Xddxa58SnLwcKEpFWUAdPayxmumYQ7lcKwDGSZeJH0UVHvTQKc6OHAhR
         lvPap8BJhw//TC110blUCyloSRtVwCAO7QC40J6kdiVe86e7PfDpOLKEAIBBgIH7Cd/M
         Gvvn7zGxHYWN1ZTcV9LYnAvuae+Pr0nsgClvmAzAXaHGVHVeyaRYoAybTbrBikmSev71
         6d6ZamJ5ZFQ2A+SnIbXdLBFymAnszkQ+koGm2R2EnR+Hh7YRSEmtZh4wwq2K5D6OlLgE
         f7mg==
X-Gm-Message-State: AO0yUKWRh1CYNhisvRY+TlfDMRK4oUtXpCKa91ZdetF5buqTdn3DFHw7
	0flrUAkdwQ8/IpPlJHMRxqyftg==
X-Google-Smtp-Source: AK7set/9PtVdbnS3IC9Awh/BF1nXIhRzk5Hcus1GHJxdPdx1wyGbJl8Mq9hyXZzi8y6s3Hhx7MfQSw==
X-Received: by 2002:a05:600c:3508:b0:3dc:5bdc:a9e9 with SMTP id h8-20020a05600c350800b003dc5bdca9e9mr3047681wmq.33.1675099267802;
        Mon, 30 Jan 2023 09:21:07 -0800 (PST)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
        by smtp.gmail.com with ESMTPSA id z24-20020a1cf418000000b003dc36981727sm11189875wma.14.2023.01.30.09.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 09:21:06 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Dmitry
 Torokhov
 <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: mtk-pmic-keys: Ignore power button if pressed before driver loads
In-Reply-To: <883798d8-f7d9-eadc-1343-7d241741ff67@arinc9.com>
References: <883798d8-f7d9-eadc-1343-7d241741ff67@arinc9.com>
Date: Mon, 30 Jan 2023 18:21:04 +0100
Message-ID: <87r0vcc51b.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_092111_211392_8C5551EB 
X-CRM114-Status: GOOD (  18.52  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, linux-input@vger.kernel.org, erkin.bozoglu@xeront.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ar=C4=B1n=C3=A7,

On lun., janv. 30, 2023 at 16:36, Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@ari=
nc9.com> wrote:

> Hi all,
>
> The power button on my Bananapi BPI-R2 (MT7623NI SoC, mt6323-keys) is=20
> shorted, so the device automatically boots when there's power. This=20
> causes the device to reboot when KEYBOARD_MTK_PMIC is loaded because the=
=20
> driver sees the power button being pressed.

What evidence do you have that there is actually a "press" event being
received by userspace? Did you tested this with evtest or something
similar?

If a "power button press" is generated, than I imagine that a userspace
process must receive it and halt the system, right?

The PMIC also has a feature to shutdown in case detect a long key-press,
which is controlled by the mediatek,long-press-mode device-tree
property.
So is it the pmic that shutdown your board (probably no evidence in
logs, just a "power cut" behaviour) or is it userspace?

>
> I was wondering if it's possible to change the driver in a way that=20
> doesn't break in this situation. Maybe don't do anything if the first=20
> state of the the power button the driver sees is being pressed, and if=20
> the state doesn't change.

If the driver is an issue, can't we blacklist it from being probed
instead? or do you want to use the home key feature that that same
driver provides?

Hope that helps,

Mattijs

>
> To address an edge case, if the power button was being pressed before=20
> the driver loads, look for if it's ever released. Only after then start=20
> working as usual.
>
> Looking forward to hearing your thoughts.
> Ar=C4=B1n=C3=A7

