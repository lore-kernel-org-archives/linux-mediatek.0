Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152F6103E2E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 20:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0VNfV7tCxEmtjzb83AyCqRFqhxI3HDw0zXzskLFZxE=; b=hCttKVsoyf9sqy1PmGonPxN5b+
	NwMTr2ThJmO20QDc6o9GRTgW+eCdi4UgFY50sfzvmuD6C7hwpnd5ayCP39anmyk6i9lkF+btazDvr
	YiS8IbP+ssnl+xF0j+1mMbdNN8Z0sSDsPIsOkWO6mdHCyBGW4e4tJOj2LJdneTNwaLKcqx61tT4sB
	e9RFiirGNjd+qG0A/bkvYUdmT827kw6knM1V4N129y8aUVMGPtbuuGGJNcpEyZTFtcfmKvt3MzowD
	M+Bk6PGYOMZEwxn7d4gSA5jjY34Sz8RLAh7tMfAMOrHsMvJIyVT4zw8JHmWSKUPzBuQT/CFb4YwNg
	gmqxmp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Qas-0000000CWj9-0qIN;
	Wed, 11 Mar 2026 20:55:50 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Qaq-0000000CWiq-04cy
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 20:55:49 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-662c6aca253so330890a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 13:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773262545; cv=none;
        d=google.com; s=arc-20240605;
        b=WCD5QxQJ5dF5nLoN6p0/KyKsDZtqnuAG+M+9QTz+b/vdFtpK2QKmE7jdAPCrLsavzL
         eAiXRUiJRJsV5FZ7PJQSZkBpCSuLTHpHInVj9uk9uIefcYRVa8y0s9/clugsX8Cnax5N
         N6IBLhdQtefqm72PhrQCcIJk2bzxgqJnAlnK7YBObvEFSoxfU1mA01ihB0a9+8pbyhYv
         c0gpF+AJinIRZmnT7P1TG/8usnvsMux1eCS9U27lnGyMSuTAOzNt99Ix9DHsUiCerf75
         2cuqLVx6IBpMvXDhMNmqH2/afQJ8r4l25f/9T/AtaC6JiO3t70UZYu217nZ5xUgG/ECa
         C41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E0VNfV7tCxEmtjzb83AyCqRFqhxI3HDw0zXzskLFZxE=;
        fh=WuK+veiwj7PUwko+MgT1yiOhDdQvidCBF+WHUIyle4Q=;
        b=JEH2m7fYVbo3o7OjRH0ratZZo8PHCuiwEVTYlAdhezcwvguMDcnsdIXYEC4Bk1rB7u
         AL+8X6OQ915oMKsqu+9PMhGe0ZIJEWAq+klHDj/DuR4AYU5tz72f1wFbPa8mjC/tl/xT
         JnJnjgIiG4BjTX3fp8ALsyMY6jVzEGWYxkPJFsbDmzPrn2REeAa6FqF7uaOJdEzmic57
         /rS1+FN83musSLf18XFd1f1XCx+Y0QV77zQHs9LxniyJQ6llcWEF2waZjGPyVYMFc+Nx
         hH2rgqpmFShCDci5GAaafAs/QzeIqZQGa/pZ5xd2nWX1k3MajvMLUSFl8sRM5WxlFGb+
         t9Qg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773262545; x=1773867345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0VNfV7tCxEmtjzb83AyCqRFqhxI3HDw0zXzskLFZxE=;
        b=AlVapYDGm4v2bkHQ4gPFIyVifD2aGIB56Z63+twTbTVK47Ked8B6UBCPj+J8kVQJXG
         AylrpnjukcCzF9QQ953KoOaJwFe3R4QIXr9ApLWtHoSHLz4jVLI/Tmi1ii4a0uvswmcl
         0KYXrnNfgblrLKA8F8Vs1rVh+hQ40Nh3m5SmO1HFGM4/jnm5b66Rbdw4tPnFJ8fSjPN0
         8T3VuOQ3Wpn4URge0vY+szHwAxWxVG4spGMNllmmTZqDFj+9l+x9hZtWbg02884Zvo0S
         ZtKdvq/pLVkRT6fIhn8ND99+Re1z6Kdj1n4UwQw1UzAxM6UmDiZxRxHJNjCzoax50eLS
         241Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773262545; x=1773867345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0VNfV7tCxEmtjzb83AyCqRFqhxI3HDw0zXzskLFZxE=;
        b=XXPUzPEeGBfllC/QaIBnpYqbS+bp7K2mMWJjILbdwfGdNoJHLzY22+bKCwemS+SkYG
         8l2EeVGVoYHGAP+O7aFeKpAJsskAJ3OQ75eM9DC/LxMHC4KhCrlmOmylQ48SUqIKvyW7
         7VfkRppUevbvkqjXEEK59Cr8eZeuz1cstXTxHG7Hvp6IjAXao3KxQwFDr8eRAxGhAUkx
         T0SViGhQzhQfpuoDiCqwDewz1CZOsOAqp+8Muq71LKOCzwx038GFboB15SuoTPntL2Gx
         oNmvfMWUSRB9KJCQNBGGN0MaFT/xdCB3UZ7OeJiqJoOshiY+ddZeYmb6cUF+eAJlFtLm
         KqAw==
X-Forwarded-Encrypted: i=1; AJvYcCUMfm+WYpqhrlSOEutK1RKV/IIM8+Bp9nLLXTz06ocXHrdzF/tYbPp47Yk4/VF59hWyHesyDrQxh6kRZ5kUVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsLohVD2nYx0gwouPVyxqt+ERrzOOn+uFXPJuRV67bzRIy/4Wo
	Dfj68N4l1/BSFfZ/d2OLfez/KE4AHbLgiE9wAY0hVMfwWDnQWtpJsyrS6tV59InpCO//It5S1h9
	2B/Ah7Yq+UCvyhRcjf9Fpbp4DbAYakak=
X-Gm-Gg: ATEYQzynMjvH5fF3lsPlzQjEqwMkC5a9wxaJ4TSgqOVkCZJ3qlGkyq5mwo7BenM2QWA
	jsHgHIoE09Yhmyu+Dt1+ut5VdtdR9yVO9Fu1T3emyijaJQpoaJLGhg6eZgm9fUdlRz7fb7sMDNm
	A6C1C1kjfWJ9qcXNKUP+b62V8CXkPWAdOpuGhftjagGxVPmzP+Q1tMY0PW6TdWiKC4IUaSEbcSP
	u8ZvWDb7c3fiUJ9bDio3QljIEH/xvUU7iYV4R5Qyoh5d+/p6LFT3LlWXizPhrDlY/OHZ00epTKp
	7jsMvw==
X-Received: by 2002:a17:907:7f8b:b0:b96:f0a0:c7be with SMTP id
 a640c23a62f3a-b972e4e65c3mr258431666b.24.1773262545016; Wed, 11 Mar 2026
 13:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <CANAPQzi3BkfnRS4CEXAA560O5cO8e6MEYxeVVx1u+xUeXS-gmA@mail.gmail.com>
 <CAGp9LzoidBL1iYYC371+Fw+drbArLRTneJKxCoFiitx=dweKCg@mail.gmail.com> <CANAPQzjiBf8Rqphn2SypYN2O6bddj6vB=63Mp=T5YVEt2oGvyw@mail.gmail.com>
In-Reply-To: <CANAPQzjiBf8Rqphn2SypYN2O6bddj6vB=63Mp=T5YVEt2oGvyw@mail.gmail.com>
From: bryam vargas <bryamestebanvargas@gmail.com>
Date: Wed, 11 Mar 2026 15:55:33 -0500
X-Gm-Features: AaiRm53s2BHcShazZ_pjmigUvkBoNI8RYCyLF6CKrVcuvllGJ-ue4U9Rd67-g0I
Message-ID: <CANAPQzgiE1rMP3F=5NJg3hp2uBXtq44+vTRBdkHwdfHyXJ8MQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mt76: connac: fix txpower_cur not updated in mt76_connac_mcu_set_rate_txpower()
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_135548_133718_950A01F1 
X-CRM114-Status: UNSURE (   5.22  )
X-CRM114-Notice: Please train this message.
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

Changes in v2:
- patch 1: implement mt7921-specific .get_txpower callback instead of
  updating txpower_cur in the write path, as suggested by Sean Wang
- patch 2: trigger USB reset only when mt792xu_wfsys_reset() returns
  -ETIMEDOUT, avoiding the race condition with async
  usb_queue_reset_device(), as suggested by Sean Wang

Both patches compile clean against v6.18 and tested for two days on
MT7921U USB at 2400m altitude (Bogot=C3=A1, Colombia).

Bryam Vargas (2):
  mt76: mt7921: add mt7921-specific get_txpower callback
  mt76: mt7921u: trigger USB reset only on wfsys timeout

