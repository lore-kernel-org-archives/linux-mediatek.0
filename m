Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD2ECD98C7
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 01:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/yLg8s0XHQpVqmfSBCS15YOtA/IhmtQG6SpKrCU07E=; b=TR95GZygHe3cvXXkTXVJAQ3jmB
	B8ctpl6Dru2VnNRPbJVqOcEEpIuV762rYNremvGHDWD+zmU6jCAtEdkYrrnqctkw77mWy8CIxEqHa
	4ByQ225YmI4wb5bjHLXfCsxgEIIzzgktZu6QwJ/t76kl0jFx3GEZ2w23kR1Ysk1J2RQQLYAAgElGK
	8j1KTyVIGcjsUgDoTFZ30vDgY6IE7JQsQOZKCqsyleqo8pcwEibNt5/qG7S5wN4blryLukbiX97O3
	C8OclU1po8xTcdxQzTYIYG+BqyTsg+gTL+nLiyu+BrC43MuoG435Gv4nCinXbcFJMxu5MkQ5aUzmr
	nlZjBqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXr1R-0000000AGl3-24yI;
	Fri, 12 Jun 2026 01:49:25 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXr1O-0000000AGkf-1nBK
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 01:49:23 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-69d7e72b052so333068eaf.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 18:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781228961; cv=none;
        d=google.com; s=arc-20240605;
        b=gbHomJ9S+bObneCIFl+seZkVTsQ0MAimN4TQDmg4BeHAf95yZlu16PXVghEf7uWaic
         XH+wppkzNT5eA0xv9oTtfiYDrjlICWcctuCUiYdOo5cPNfkSTCERGsCg93jU+lZyDNuO
         +bvRwpmnahyDNBtXDaW4MD2tMSHN+xetIhZ4UPP4AypKo9aybsKTMC841iKCYSa/7qZZ
         x8mK6mME+GOA4XeE+Rh0ZmzcPdvdB4l9lNV0RJHxg6himjVrG9pwtpB4o12qtWJXNIr0
         Sn/DzKDakYgPifq7SX6IAhSz5kNJBi7eqrzzREdYFkLan/fXJ1Sfn82B0d1YU6xVAuqK
         uuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k/yLg8s0XHQpVqmfSBCS15YOtA/IhmtQG6SpKrCU07E=;
        fh=HvrrnfmODGHqRtiRFpFeQo1ubgJMezku/OZ3EPlu1ac=;
        b=Gt8UxKPusDtrRckCwp62WJnRZKbMwjtKQepcavABo54SQtebFi00BJG8vk40QsGFBL
         wHXyMkGisyudg+JF3RuBRcYl0AcIjpsEyB7N7mBDp3QgEW0UTzOUXqwbSQrEsfupa2KU
         wqTdSKj0pGXN+KinYPgDoxaMFQa6tMYAbcQqBAyRFDUQ8o4nkoVN8xYZTUImvFCN1o3I
         YIn1CFXMqkMIPBdmzNt7Xct/uVWGLz6FqnjZSImx+Z4pL5qNZFRTKCN/JFXL0B4rq8CS
         z7x4d3Wkmy4+FIGAKWCB9cpPDAmXSueaq+KQUAVER/CbrQAxsjKr7BF1UAKD/wwJ0hzk
         PdLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781228961; x=1781833761; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/yLg8s0XHQpVqmfSBCS15YOtA/IhmtQG6SpKrCU07E=;
        b=bi8GfqeXjetF/w8Y3Q4AJFgXcP0VrHO41CfeXKLhdsM9iJ1TRQkmxYUBTx/f2s2NIr
         QcLFX8ayTvmOMEBv2UfBPYD1XgpxU6bpDsa/NgsZSQ41Wai46XCVkSexPENhDAj2dgqH
         lX2ij1QAjlU9tl1v6kkU2ooRaViZD/GMlDF/9/0Ai07Es14rBmQtttHnbf+017dJrKro
         WutlmHCGw1GCyVc6cnAHDaoZ7z46leCDScvMiDjVDp/9JVmps33x0ThrrlNW7UkbXGk4
         bGno/N9JD9mP+ZObKY3D8pdqr9545kjTlxEOl49TZLQSVji1wpJRbBvHbHNk8VwbGlWE
         zEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781228961; x=1781833761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k/yLg8s0XHQpVqmfSBCS15YOtA/IhmtQG6SpKrCU07E=;
        b=isda7VZFNMt0YBxCMH7vKgL34wwmNNNlnRfoQExkKdR286f6a2rj5jTmIi6sQfWFjy
         O/RddQO1NE4sec/NU59WddpJIJ5b4wjFqQtNQKh6u/Cw2HVmczqho6lAkXKVoUA6PnAk
         Lly2ZmcYiO95DxHFzklJ8o6JEw4jKJA6ovxFy1X99RFLms48Buzx8LXEeOPI/GJ2hxB5
         h0GzHRYtmxMxIox1BabS+ZqXpkY/h/wSsrZtMQEjaOc9RI+V6PDcqIpLtRr0XNxa6awR
         7V9EOATIQuy1D2tt2Yhq9l8duT+mJRidu8I4N32uNZQWflhkjlCpMgIM3lhWEd54cXjj
         9PWw==
X-Forwarded-Encrypted: i=1; AFNElJ8DyYgd4BYyolschQeSzPp38CNdvScerGi3nMDPhT7w5853LB/3yJFQTrlm21Kg28Tl1PehqhUg7o5fo9ahXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvSCuFaQGmk8Iq1TIgALf/B5BW1DnlV9tkxYhkPkZPJWaM/IHf
	3hAtgVStvSOYNV+SvOwQnx0K4/T5i8JjZOMNlat22dWTp7q+I+BGc2uvyfwXorpW/oFsySer3Uh
	A7hmzCkQfX1R/WwRaZOxHLUdxLZVsbvQ=
X-Gm-Gg: Acq92OGQ7tqvwA3x5B2iI/uT9MEJNJiaVrRSgwviZxLsaXk+DBbcySH4G/QjdgfNo8I
	begECyaIOfn79bJzWy2JnZ3SaWEjypjvjW1FmSqzF+YG8X31TPYxfectE01vc6h6VJ4HhsrRoIC
	wWB4zlUQ1RKO2OHbh5KnEXB03nLaULw8t3bGE1w6bptKITSdx4zMPo9K1jpCQnRHphISxtib3nc
	qMoQEbQ/NlLwkkeHNIqvxz8tuHHoHVVwIU7tVUz8jCW2Vev3UAtQCri0iuCg+HnzCqaqCH9esDg
	e9QZGZBJ
X-Received: by 2002:a05:6820:1ca4:b0:69d:e2fc:361a with SMTP id
 006d021491bc7-69edc6f436fmr591736eaf.35.1781228960782; Thu, 11 Jun 2026
 18:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <CALaig7Pf++Hqn_c4hEa8zXHKkJpbmfSk=Bet_W574o7eBKF6Rw@mail.gmail.com>
In-Reply-To: <CALaig7Pf++Hqn_c4hEa8zXHKkJpbmfSk=Bet_W574o7eBKF6Rw@mail.gmail.com>
From: Zitong Zhao <zitongzhaooo@gmail.com>
Date: Fri, 12 Jun 2026 09:49:39 +0800
X-Gm-Features: AVVi8Ce9Ncz2jqaxVpmhTCw9AKNqguzmtwufqUXZ5nQfclbNp2-nmox8y2xjVAw
Message-ID: <CALaig7O62JGRYW_dR7V0JqCBaZfDktfTUcJRx2DSWkB23yr3+Q@mail.gmail.com>
Subject: Re: [mt76][mt7921] Question about host-visible deterministic TX
 scheduling / TX completion timestamps
To: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, deren.wu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_184922_493971_D5BCFBC0 
X-CRM114-Status: GOOD (  21.81  )
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

Hi,

Just following up on this MT7921/MT7922 question.

A yes/no answer on whether this hardware/firmware stack exposes any
supported host-visible primitive for TSF-scheduled TX, firmware queue
admission, or reliable per-packet firmware/PHY TX completion
timestamps would already be very helpful.

If this is not available through the public mt76 driver, could you
point us to the right MediaTek documentation / NDA / direct-customer
channel?

Thanks,
Zitong Zhao
Cyber Physical System Lab from Shanghai Jiao Tong University

On Mon, Jun 8, 2026 at 1:28=E2=80=AFPM Zitong Zhao <zitongzhaooo@gmail.com>=
 wrote:
>
> Hi mt76 maintainers,
>
> Resending as plain text because the previous HTML mail was rejected by
> linux-mediatek.
>
> We are working on a deterministic Wi-Fi TDMA research prototype using
> MT7921/MT7922 with the mt76/mt7921e driver.
>
> We would like to understand whether the MT7921/MT7922
> hardware/firmware exposes any supported host-visible primitive for:
>
> 1. TSF-scheduled TX or hardware-timed queue release
> 2. firmware TX queue admission / queue pause-resume
> 3. reliable per-packet firmware/PHY TX completion timestamps
> 4. TWT service-period control usable for deterministic UL/DL scheduling
>
> From the public mt76 driver and our local diagnostics, we currently obser=
ve:
>
> - RX MACTIME is available and useful for RX-side timestamping.
> - TXS can be forced for diagnostics, but coverage is partial/asymmetric.
> - WTBL_QUERY returns only a short status-like response in our setup.
> - TWT_AGRT_UPDATE returns ACK/status, but we have not found evidence
> that it provides host-controllable deterministic queue admission.
> - We did not find an exposed TSF-scheduled TX path in mt7921e.
>
> Could you confirm whether this hardware/firmware stack supports any
> host-visible deterministic TX scheduling or reliable per-packet TX
> completion timestamp interface?
>
> If this is not available in the public mt76 driver, is it a firmware
> limitation, or is there a documented MediaTek interface available
> through another channel?
>
> Hardware/firmware in our setup:
> - AP side: MT7961/MT7921e path
> - STA side: MT7922/RZ616-family, mt7921e path
> - Driver base: mt76/mt7921e with local research diagnostics
>
> We do not need confidential details on the public mailing list. A
> yes/no answer about whether such primitives exist would already be
> very helpful. If this requires MediaTek confidential documentation or
> an NDA channel, could you point us to the right contact/process?
>
> Thanks,
> Zitong Zhao
> Cyber Physical System Lab from Shanghai Jiao Tong University

