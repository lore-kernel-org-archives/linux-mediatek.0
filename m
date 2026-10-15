Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF2FCC6B3A
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2026 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zsThSPhIE6QGWwQEvDK4me/jRV2aNmYqF2LqA0tXlY=; b=Bj+ehwhF1HNqG3bRzqPapS80ok
	geCceFZaBhw7ePpjfEh7aMwB2IabQ7xybtX2MN8Jjq8nu3YlebYV9hBvS1ffDufyruLtN6F6Sp86s
	+678OtfsiJo1++i1TInCSxxOuarVUy42hsYHBvDtIXnoCAJA4WhqIJxix0U1AjIfBFOiUU/3f4ssg
	tdlAXFqARK/FJHecY4siqZzFpPqIdTb8dXVn6p+tmQl3FS9PVO9DaPVWrPi8AFLGX/VLt5MrFTPhp
	o1ETdWNxMbIxKg9iVsumhBLA0DIIyXTk/TSHGfvE69p6q8xX06P/JcHG9R3V6SMDYWeJbJ5HBe/dJ
	86E8diVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLoQ-00000000I9G-3oWH;
	Thu, 15 Oct 2026 13:48:02 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLoN-00000000I84-2UjH
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Oct 2026 13:48:01 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8b0d91601bdso4543637b3.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Oct 2026 06:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792072078; cv=none;
        d=google.com; s=arc-20260327;
        b=TmtBdpyPMOkoJPFcOxRnTiQ0zOzy1fXx7lJbLNJsxhhCpwlBmScb8T5HVhMPuY2p3W
         aPuITmEW4Wv63xyWgraN8pp5JJbwgvaTTQysUCp++mcnr9U0gBHDRURqU/wDmNarBI2i
         TEphybt+K+uW5GMyOIY4UvUrcEGH2ts1dKm04YoTagX8hgRexMoRA1WCdotx6+nFJSRP
         naJwdPdGMQVrcrRdPuYk0kLlM7i/UUsovIZnQvLPFSdl+d9AYQpoLqOyW9MTKyr8ZW1T
         M+UVkAsJ9BCn3LWsVkmNLiqCp1pygGBsAQmbbfv6VTzwl5OB3IqF3WpH03BPBC4YEUGQ
         Z3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0zsThSPhIE6QGWwQEvDK4me/jRV2aNmYqF2LqA0tXlY=;
        fh=6VxLZU5hIa7kHrHPp6djRYzenvIDaJkp6QVPuXweGTA=;
        b=ThQtjbqult4pZzH1XIyqwE++GrhwlWO+k+NpeS9MVQPVlVfBknehJSPcrY4b7XiA+b
         nS+wHPXX1NlMQR2gqfuma/izURsHrVMk5jcMPjyRJlYzFoboA8kRDIuJ3FiFE2+MR1Bn
         6ZnBHcZfcjSyXk5kh1uMHXykZWW2M2ke1PDTx4jILnA4dCKnmUfO/D1ODdy4pAj1KTJL
         W7BAiSfWfzhJtd62WmuqKBMTo8y6rlWYWgvKeWLWvA23Q+UgIK3CjBI+4ZQQx80JrVEJ
         fn0AX8gaCn1CRQJk8YMevZD1un6nl8WGyyn8jkMCaQJaAE1by1Bq7GXp31G9o11dpX7l
         WMTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792072078; x=1792676878; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zsThSPhIE6QGWwQEvDK4me/jRV2aNmYqF2LqA0tXlY=;
        b=ovdRxKuyBDVa/4wDpARz5wWIvDHkUlq8UdXUdrkmFgKvk01rTalE7d5VgvWN7kTXqd
         8roN8XoiZ5fgcwMXBs8hjcbkteQGDQ/y2KYVwQUVZ4utdVN1Q8hX3MkE98bVbQmNKDoN
         Cj0BEFpW/WEv1PfgoKs2DBWCP8Bn1hkWg/Lgg9ecZqPwKl3VbkZWaKD/k6Kl9pwpRtNP
         SW08X4uPHp/0FjDOjpbGFaH9BCccXbX8N4XQpld4H6n1cJPO79M6e56oZ8TP93Tnr4kb
         bs9lC1ahsAm/FpogzSRCeGC2sPUzMETjrZ14ig83wC6yoXbAhUeQQjcpkMVpI+o9is3x
         fyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072078; x=1792676878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zsThSPhIE6QGWwQEvDK4me/jRV2aNmYqF2LqA0tXlY=;
        b=QzMJ0z5bNWIzuLY64LL160szvm4cuoO+AGixWj8/tAY9cuSj9GMARiugi0PhLtoKFD
         I9s9I+cGXzk7Z4yEWg9HNv3CgA/Q8XD4KfwSaq68YgT+p2tEjvv6d7ezDcozp9W0vbCJ
         tP1L7Vktlcvz7zxR5qyIBmHgy1zuR76vqpN1B+GlxM6aBEEys4y00xDRibdy3A08qLTb
         jVN4aKu4nIp8Knq0+u0hauuASMy36T4HRLXrBsHlKTDKE1d2LkXP/xSft49+R4WOBcIJ
         Nc9y6Yx/INiUv5cfbX7h9LEGSh7oCAGVH8cXl/7BIRmNBsD4bytgLr0H9JXzUQRlFfHD
         W3eA==
X-Forwarded-Encrypted: i=1; AKwUvBwE0UDlAnOedNne01wcOHJqn5A/g3pn81oaH3w/UTvpS+0DLVlB3PhJpHYytLJXZM6/tU2X7/0eGr7M1kpV/g==@lists.infradead.org
X-Gm-Message-State: AFq9FYKWwukl+UD7Ibf1VF2uzffM9sX9WEF8zeIfBPWYTryor4kt1WkL
	4XuyxF09x8oOiNXZ+lY9sgFrl16syXtJT7sOIEs6Tt4hvrTguIOb8pcBcsk2vaavCG8OedzXt7l
	4nSM6YUarf/QzOey0AxXDcRDJbeZPuLZbfVwto7/nxA==
X-Gm-Gg: AYBFou3dgTTzCkGQCnKHQ+nLNQmF05CZbUgQVDqyRVbOxKUlbRgY+QDQIz5FSSxpxLt
	SnHNmLLP3FdxO/Ls1spIgyMqYp/4YFyT9B3ELJobDPFPYhItXpkYSWrHvvfL2n5GXuYQtgbsJ57
	X5ZFawrmdTElcOG0PJMLNVQVoGbmqWrl0YqEiiWTWJbnhLnZ6M5ceNGWENJ/+hxPo0k9MUgMVgX
	a6DNS0PmLMNhwMyonkLLCwoePtwzjAPBnXaMa0ko3x4qR49JRQOrwxrNDZZPZiDtG+aw+geII/X
	ogbguUdiX3IEdHXnDKdqSUraJXH6/MyPNnNOGseti1M/rkc+fDwV9a6hbEEiAaGoRpeUFJh+ovP
	vfFzauHEuOzsl2KOQYEk1tH0+zX3jFxyr8+Ym2xI=
X-Received: by 2002:a05:690c:e694:10b0:8ae:b617:712d with SMTP id
 00721157ae682-8b0e2c154cemr221067b3.13.1792072077811; Thu, 15 Oct 2026
 06:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20261015081450.1241194-1-chris.lu@mediatek.com>
In-Reply-To: <20261015081450.1241194-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 15 Oct 2026 09:47:44 -0400
X-Gm-Features: AclHuK-9IwK4gtIgFJ0IOoJ2ujxMQ8YcnWXIl-i3b10cUaiVlWQ4WrWnE6daL6c
Message-ID: <CABBYNZKaRo1SLa33mWwxE0Vp+3Wd=tJpvTFru-q8uraysdw4Qw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Bluetooth: btmtk: fix ISO data reception
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Hao Qin <hao.qin@mediatek.com>, Wenlong Tian <ot_wenlong.tian@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>, 
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_064759_643840_70E788BC 
X-CRM114-Status: GOOD (  20.98  )
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

On Thu, Oct 15, 2026 at 4:15=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> Three fixes for ISO data handling in btmtk, found while debugging LE Audi=
o
> on MT7925. The code is shared by every MediaTek USB controller that
> supports ISO data, so none of this is specific to that part.
>
> Patch 1 drops the zero padding that the ISO interrupt IN endpoint appends
> to each transfer instead of parsing it as ISO packets. The driver turns
> that padding into handle 0 packets with a Data_Total_Length of zero and
> hands them to the stack, which is what fills the HCI log with malformed
> ISO frames, and a valid SDU is lost whenever handle 0 belongs to a live
> CIS/BIS.
>
> Patch 2 bounds Data_Total_Length by hdev->iso_mtu. The existing
> skb_tailroom() test enforces no protocol limit, because the skb head
> allocation is rounded up to a kmalloc bucket and skb_tailroom() reports
> the bucket size rather than what was requested.
>
> Patch 3 updates the mt79xx ISO data transmission setting.
>
> The three hunks do not overlap, so any prefix of the series applies on it=
s
> own.
>
> Changes in v2:
> - Patch 2 reworked and retitled. v1 only enlarged the receive skb, which
>   turned out to be a no-op, and added no bound at all. v2 bounds
>   Data_Total_Length by hdev->iso_mtu and sizes the skb from the same
>   value.
> - Patch 3 added.
> - Patch 1 unchanged.
>
> Based on bluetooth-next.
>
> Chris Lu (3):
>   Bluetooth: btmtk: drop zero-length ISO packets from endpoint padding
>   Bluetooth: btmtk: bound the ISO payload length by the controller's MTU
>   Bluetooth: btmtk: derive the firmware ISO setting from
>     MTK_ISO_THRESHOLD
>
>  drivers/bluetooth/btmtk.c | 37 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
>
> --
> 2.45.2
>

In case you haven't seen it sashiko flagged a problem with this set:

https://sashiko.dev/#/patchset/20261015081450.1241194-1-chris.lu%40mediatek=
.com

Unsuccessful packets shall still be delivered to the host, this is
used, for example, to implement Packet Loss Concealment (PLC) logic.

--=20
Luiz Augusto von Dentz

