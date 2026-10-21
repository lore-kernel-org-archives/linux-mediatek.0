Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4888D606A321
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 14:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SI04WCeD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zy7CUy26
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH6oHG3/Qp34ti4yckIWOW65CjO9OEZZdj56Vscx/3g=; b=SI04WCeDx3bytdSCxZmHzfNUpq
	VwLbfCPV4hAdgLLkMREqrP8+Zrc929vH4NqrW4RqM91Enfo9Akt2xsdcJenbdK5pNqdDyyST3e54D
	Ds4LNUeHN9SUGJZTyV5HJlKgWf1eVi2OIX4sRNW/WkmHv/axzc3MHKSkl39XXaoRMGhGQ22mYfOOD
	4juBJYaWYyP8k95P2/zYp+0ASQEuTnFNe2KHOeXLga6bX/k+mkTYyINaGsaSERIsqgGg0/+kRQmKR
	3fSupqDxoU/5OPBfGcYrXv3F4ReHTd+PWOXBr7ZeW/RJ4VP7oHCfwTo9iC7S8TX8Ysk/K6mnKaz25
	PykmdV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXEd-0000000C5qO-2c1M;
	Wed, 21 Oct 2026 14:24:07 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXEa-0000000C5pI-46Ls
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 14:24:06 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8ac525c1f05so6695427b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 07:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792592643; cv=none;
        d=google.com; s=arc-20260327;
        b=o8kErmq/sk8JXVwB2Kc7eOpwKtHM3cmgFwbqKmqtPv6XKerK9k34tvKXr0g0zLMR4L
         yG5qBZWQaRdXGO9oWou3kWqFOoGZsf4u0rZHsyYI731/KaLM2apdW1TBSvmb6vhvZvU+
         OFmEVHTULD9FQTOH23kiTt731ki3dIWPxiJBHks/wSZdRoJq8xGydwwNKBHHpLTohK3n
         kB6SodUO6loX4XrcWboVFjnwMm03ho+qu90qchMUjDpWbzNvp/eusrcGBVDUZaUJxvke
         0s+mUUOsWfqBTOmczm35t6Q1P0sHy4FZX9PWZYUx3L/mOWl1xNwA/p3osSdt9+1/oPfM
         H9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CH6oHG3/Qp34ti4yckIWOW65CjO9OEZZdj56Vscx/3g=;
        fh=r7omf7PbTY0WDOuOHnjKzUirJXJNgCXgGRF4sP8VXFo=;
        b=edFQfo5tbADLBTBpoysdWL6gUMQ+8ZNHpZpRz6E4NOzuSm6Jdkus0X80phb1pP4u+d
         AZ+7JN8O4nZCDH6AHuRtI1LrM4P4pvl+T/sDOWQN1MxO56LcmhSNtjFjTtMIbKewliIw
         Gbrxbu2tzn0kZ2hSCo+h+nCT+5//9W1iIEbtey7uc5S93iqTD8EGXhLq1awjKId0u3tM
         D1rFSAI+IRWGbSZ6hOtO3V1JTxQGANItjCcYKvumfiQ6gDnvyNfSmIkcT2OfRf65nj0M
         i8URqUflh0bBMXMNTFeYXuwUDylfGYR5t+/XBUNUnVEDfqPG4IPiZzx3LWmb40DviNuC
         g4jg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592643; x=1793197443; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CH6oHG3/Qp34ti4yckIWOW65CjO9OEZZdj56Vscx/3g=;
        b=Zy7CUy26kpviuBgUAzNgux5v/tzg+hjMlrhJk/MiVzYsPST1NShHLUTn3UTSUvnW6O
         HQg7hzdXpr9h+mv+dKl6FxhYc/Ci/5YjpUkb3CIQxmvBFYn39obBeXD9EDAEvhtDkNUj
         4SuIN75ZZ4OltbPqKxlEtaz6WsJte4IPVltlhythE51hPKST0SVKfMbBNKFiNNPlmTME
         5Hrjn1rdSoeZWMbisxQdDXhCysxqW4FofmmZAyywIy5BVsOgkzlQ8Kej7LIs76pEfHJ+
         8WCPq/f/oYa+PerE2ZJzxhQ/OWK+zKQgHMx/SG3W/otxh4yS/cN17FYZklqqAv5GCVwQ
         1p1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592643; x=1793197443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CH6oHG3/Qp34ti4yckIWOW65CjO9OEZZdj56Vscx/3g=;
        b=NGui2eGVh2xnK63Ws3cT59fU9O8dcO5o+S7A1Wxc2bQCDyBBXlCw79yRJNj3yDNU55
         Evql8TF/poD50sAu2Hqy15A2Trf6P6fhnaEqxhK/o2VAMV2CTfuLMOx2rYmmZIRp2Udd
         CsxsshE6fGxPTN/QCdxz1ebj/PdXuM3yfOo0IJRFiwdAt/Wp7rURgLJdUzSmLFfgX4O9
         lssumQiy3j103LuZ8+qsSsE6y2uyCFqgLViFJCfzkd7RdGnAWIF5W886FoFesqM0SDnx
         rH2EKoomOdmR8a/q7kikbnnaS8Mc1EdIIwDuCZLn41+bnO1vA9rX/9IBuAGK2LlXNu6R
         tcww==
X-Forwarded-Encrypted: i=1; AKwUvBwISlIT4FCq8mp6Vy5UoNdH9kNmmEqcX+ioKVIWCnGenlskiWWaf0jNhJQYqgMpq5+vn1dmP7IMy2NWNE4VPQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKmbtylHqQ4dvup0xkllX/GMenFcEoLh3sF5GUZoX683X/ZcBGy
	PRF39d511qwzq7bjvanXVMTPkr1BsCa8qU7Sm5wnQX3tNRxNDSfJ14KUZQlSrmch0iVDDxtQjLo
	AIuqcQ0u9vexFzR9tSGB2JDdvjiII7Zc=
X-Gm-Gg: AYBFou14BZ9wdZE+Mf0IHn/PqmfID4eVNUm9LWwqzLg0W6a7UfVgLjoztwAtKMLy/bd
	cvS4IoCDUbuhdbpa3bZsKbhRy68D4RJPbUST3DARXIqC9eR2F0r8i6AtHDp2dr3YG/ZCh7OJHmo
	V593wmMz4HZNZJF/Flra11V9JJQetqjt4QJ6Yw8KjjEZKR+WA9lBwBf/uG1WYXiwvR8Ec9B0dYU
	gi7vlQhfjhQhoI70IEhjNbrExY+PRyA3iXDKoDe9trJfxAcPxbMEPthMnch39BCeIoC5ZDI/fkA
	1WuMoXrR1NuKDn7YWJmom76qjID05ePFpNhdsbbnZpLYxQPkhZ8upd5umzjxWGfXwjaR5xZqDcq
	k/alwb5T+My0+yjVz3Mj9n20RUWrCBJqxp2KYpuriF/UG/2iqu0mFkkVHo8hV7HUlBOaZXkBvrZ
	GuknDs5d0JthzmlWD1SYS0
X-Received: by 2002:a05:690c:e146:b0:8b0:aba3:a3e2 with SMTP id
 00721157ae682-8b133d39371mr7017367b3.37.1792592643275; Wed, 21 Oct 2026
 07:24:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021084337.1515468-1-chris.lu@mediatek.com>
In-Reply-To: <20261021084337.1515468-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 21 Oct 2026 10:23:51 -0400
X-Gm-Features: AclHuK8FmV1TdL0_oevKDcXRfpa4yUifRgu3gHeeFUqDijVRdFDfONErTdM1fR0
Message-ID: <CABBYNZKqAa+3V1k3U-NBodfAhYRV3ZqX4V7bp5NFrXY0ndgL7Q@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/3] Bluetooth: btmtk: fix ISO data reception
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
X-CRM114-CacheID: sfid-20261021_072405_021362_476A14DB 
X-CRM114-Status: GOOD (  19.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chris,

On Wed, Oct 21, 2026 at 4:43=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> Resend due to rebase: the base this series was previously posted against
> no longer exists in bluetooth-next's history, which is why it failed to
> apply. Rebased onto current bluetooth-next; no content changes from v3.
>
> Two fixes for btmtk_recv_isopkt(), found while debugging LE Audio on
> MT7925, plus an update to the ISO data transmission setting. The function
> is shared by every MediaTek USB controller that supports ISO data, so non=
e
> of this is specific to that part.
>
> Patch 1 drops the zero padding that the ISO interrupt IN endpoint appends
> to each transfer instead of parsing it as ISO packets.
>
> Patch 2 bounds Data_Total_Length by hdev->iso_mtu.
>
> Patch 3 updates the mt79xx ISO data transmission setting.
>
> The three hunks do not overlap, so any prefix of the series applies on it=
s
> own.
>
> Changes in v3 RESEND:
> - Resend due to rebase. No content changes.
>
> Changes in v3:
> - Patch 1: instead of dropping a packet solely because Data_Total_Length
>   is zero, also confirm that the rest of the transfer is zero-filled
>   before treating it as padding.
> - Patch 2, 3: unchanged.
>
> Changes in v2:
> - Patch 2 reworked and retitled.
> - Patch 3 added.
>
> Based on bluetooth-next.
>
> Chris Lu (3):
>   Bluetooth: btmtk: drop zero-length ISO packets from endpoint padding
>   Bluetooth: btmtk: bound the ISO payload length by the controller's MTU
>   Bluetooth: btmtk: derive the firmware ISO setting from
>     MTK_ISO_THRESHOLD
>
>  drivers/bluetooth/btmtk.c | 44 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 5 deletions(-)
>
> --
> 2.45.2
>

Sashiko is still flagging a problem:

https://sashiko.dev/#/patchset/20261021084337.1515468-1-chris.lu%40mediatek=
.com

--=20
Luiz Augusto von Dentz

