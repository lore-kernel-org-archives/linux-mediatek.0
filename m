Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018A0106ACC9
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 16:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KM8KaYwOxl26cN0NYbbOg/R+fvkWdnp9O3HOgTyJzNA=; b=Jf5RKZyw5d6R8qJ49ioWPaw/PN
	MHPZk9megCjqbCJLT1DCSJHNZFQLhUd9lG2/2X+Aj+Tz2QHpI1qxEGB7fjIvcYzX2dp1ykyk22s/8
	tjUwTuNlRqTXnDHGE1PuEjdUTE0lg7xJLKr55J+szqbXSDlECR2yJ3tnCr7NwtFoYS7zmz/L1fmLO
	/j7z66dLehyej8051Cpzj5CbteGWuGn+5vg6eGovPgP2720bRNuXcT/mrt9FSmr6wlltbGk9NzX+U
	MRol2NthPO1Tssi4iqbNTgHcYq2lihLXXinJn4dv6toccIcKx7/ZHoTggAhxUcC4Ke/gE5cRfQEsr
	i3M/Pp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ivl-0000000EYZk-3iy1;
	Thu, 12 Mar 2026 16:30:37 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ivi-0000000EYYZ-0Kz5
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 16:30:36 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-12732165d1eso1549874c88.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 09:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773333033; cv=none;
        d=google.com; s=arc-20240605;
        b=QE3YkNsXGwXzgI6fSHR3c0xzGmmlxyq/012Ccilvobzhfaq3XTUWJUBGwGQ+0pwwTh
         HjW28qiXIvTSYdX+UFXprSWPdB0XvAPSKvVBPtYeknNrcsdvnIcU9fNWFV13cTCgoMDO
         eVDBMn3xbH+sAsOLJ6qp3ZVrx5Nz74fKkg9DaS/d40oFWhz9kqaAiPBfbhk4Ti1YWhAr
         uHrWiMISGUGzpDpsOkk0SYQnU5d2BzgDwXlobEMmzJ1FXlOQ72nRC1Q/RIKuAR41zcFs
         PnB/mrrw85Zbteft9VjK5r72KOXFVPUQkXcmiNi0ZprdxX7ZYgwQDFnGyq51wxcufq9/
         eE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KM8KaYwOxl26cN0NYbbOg/R+fvkWdnp9O3HOgTyJzNA=;
        fh=ybGudt9KMel28B6BLCoOXWdQ7tHVsNuTZKWuLQycxtA=;
        b=gL2V3j3F7eVuXKeIXaNu3ERdw6XgGTeHVFmxOeOuw+NwYnAv82Quwv3Tip/dE8GdIT
         FByLxAT74gaRUEMEKps6yykfzPVM6HwUuIAI6bmNMBccVOaug+viPkpZrpvQY/LmoIna
         XushPja6XHlIe05yMBJKzvlF08d2CgjI/tfrjd5+tNRvx3MDFzqwJ7rSaKoizVXC89DH
         dNezgSSb11/pZRYvmnOOqpaAQn7MXFPrOleWX2aa2GBAMUlaa0SOuDGtAdmm4WjLWNzD
         30Mw4KXDqzbDcCUJjYMx8Pj6OL8oJoKeLmQSjsyfd4/P/3zrKL1t8FIUIU/qA9OBbxaz
         SiHw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773333033; x=1773937833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM8KaYwOxl26cN0NYbbOg/R+fvkWdnp9O3HOgTyJzNA=;
        b=HEuKx7WgDUL0QzK/MIdP3GAem4gPQqOXvNeIjIuaPd8fP72cf2Gcyg+YlL/lW7CfMs
         AaFu1HuDJ5r935bxjwk8K/Lxr4y/OCGmlaTlfJLuBY7V44upc6Pn6V2shg02YiMJmJB9
         2zOIcEnmUZ52LHQ3Ps/hPDX51XUnl8x8fJ6UY3LDhJQwiUYWCZPi+FSGthMCVwnHyzRK
         G7jV66rC2NIaD59ggqL7RDOT/wxL7icxMJr40wFG7/EbB/jvUuUpAD8+fPzpP/Qd70sk
         Fl7HhUVB/spp701tCl+XjVl1hIFDlhg+YRMry2rbXT4D/8WatjvMy8Jrjd0giu2GiAto
         PbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773333033; x=1773937833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KM8KaYwOxl26cN0NYbbOg/R+fvkWdnp9O3HOgTyJzNA=;
        b=O8xJUB+zaLJwUhOrqcashX//3TftSinB7FKFNQyIGkoV3zVHdq61sZemlV3zXXBUsD
         E5bmraAopiaE6ilyejT4x969oqJOziUpWNbT8U/tzlPxRn7lkySpLa3IVBO+8nP5Cc7w
         swOHzQTjQ3VzBG0kGwhmMvs/y9uhd27k/OOzdXxLMqvWeWJdscCKC44YWoNfeICFEAwl
         SiamW9nskP6pq8qI5iMsmYVWOqKx7S9zIaAYRCy97XDR9VcnGpMQfCy6qwF0PYJMuo9u
         mpPrcIESPzgj+YlITmuJE4zcGsHbZngM8FJBlvvVB9bq0nhKoFaQH3jsNzYzm16gONkF
         2ruQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbd56rF6wnu8KTvJFbUWJXCr1WU2e7ns05X12FFV/oXtmdqm4Ry/RC2kM7eQHeA5c4P5UFLntoNq/Tsa44BQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5aJ6it68QroXoIcGsn5yl1/7PeglMAyWnbsIdqmLFVO68kcws
	QgNCsAYkuVuf3Ui9Rzius29iamjdUAXaedXTJIpMBRHnjdaa9xjgWVN0HbvhwWHsShwhOHik+31
	Q3yMbq5EULG69ytrcGNu6HNKiD3MdKVI=
X-Gm-Gg: ATEYQzwfNa5EyFs4OOa/NgHo5lOVSzL4iPe3q7LUpn6DCqr0LixVqJIcFlOeTxfFnU6
	R8uqlvb9MkYE9NgB8JIzBHDuS3SP/VjjiN0rpUlzJd5+qIzL5HIkq9oNLIvAoS5HixRCmn7ZXlq
	UIxLJYAKecwqSXUWRGVhsOBAuAMd3H3Z0oiPf3Vx7GdDl4EE8hMJ0VDeJQKD7fVtXnjgFEOnhbI
	nbIO1AH+WDO5dokiLSIgrSLjlojWFvmQwAXoiZwRmtWsAdCy5Wfc0ysqOg+vPlKWE6OaX5UZUd2
	X6WfE2rE
X-Received: by 2002:a05:7022:784:b0:119:e56b:98a0 with SMTP id
 a92af1059eb24-128f3d17f5amr93984c88.7.1773333032705; Thu, 12 Mar 2026
 09:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <CANAPQzi3BkfnRS4CEXAA560O5cO8e6MEYxeVVx1u+xUeXS-gmA@mail.gmail.com>
 <CAGp9LzoidBL1iYYC371+Fw+drbArLRTneJKxCoFiitx=dweKCg@mail.gmail.com>
 <CANAPQzjiBf8Rqphn2SypYN2O6bddj6vB=63Mp=T5YVEt2oGvyw@mail.gmail.com>
 <CANAPQzgiE1rMP3F=5NJg3hp2uBXtq44+vTRBdkHwdfHyXJ8MQQ@mail.gmail.com>
 <CANAPQzgD312EPSbvaQTE6U+wn85L65+xZHms7DP509ApxWvSZA@mail.gmail.com>
 <CANAPQzgXN2UOjuwV1fRofN2syxG933kSaB9S7DyFAykHHMRzew@mail.gmail.com> <CAGp9Lzr4KsXEXbj+4h+Lk2fKU7z6BqtL5krzZmu-_So2-bN4_Q@mail.gmail.com>
In-Reply-To: <CAGp9Lzr4KsXEXbj+4h+Lk2fKU7z6BqtL5krzZmu-_So2-bN4_Q@mail.gmail.com>
From: bryam vargas <bryamestebanvargas@gmail.com>
Date: Thu, 12 Mar 2026 11:30:19 -0500
X-Gm-Features: AaiRm53n6pmgqCbUrPSX8yo07dBdb14BIJ-x5VM49Aymd3MRBVn5ECKANeFOA0Q
Message-ID: <CANAPQzj24sTgnuXMo3wqVDhA==UQ6JQLESk0AernQUUmZvTi2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] mt76: connac: fix txpower_cur not updated in mt76_connac_mcu_set_rate_txpower()
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_093035_219620_4D4665D1 
X-CRM114-Status: GOOD (  10.25  )
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

Hi Sean,

Thanks for the thorough v2 review on both patches =E2=80=94 really helpful.

I spent the last few days digging deeper into the txpower reporting
path across mt76 sub-drivers (mt7615, mt7915, mt7996, mt7921, mt7925)
to find the most efficient fix. Turns out, Razvan Grigore already
nailed it 13 months ago:

  https://patchwork.kernel.org/project/linux-wireless/patch/20250211081247.=
5892-3-razvan.grigore@vampirebyte.ro/

His patch adds 3 lines to mt7921_set_tx_sar_pwr() =E2=80=94 same pattern as
mt7915 (mcu.c:3393) and mt7996 (mcu.c:4802):

  tx_power =3D mt76_get_power_bound(mphy, hw->conf.power_level);
  tx_power =3D mt76_get_rate_power_limits(mphy, mphy->chandef.chan,
                                        &limits_array, tx_power);
  mphy->txpower_cur =3D tx_power;

This runs before mt76_connac_mcu_set_rate_txpower(), so it uses the
same SAR-bounded, DT-capped value that the firmware receives. And
since set_tx_sar_pwr() is called from all four paths you pointed out
(init, config, regd_update, set_sar_specs), it covers every scenario
=E2=80=94 including the ones Lucid Duck's BSS_CHANGED_TXPOWER approach miss=
es
when not associated.

I'm withdrawing both of my patches. Razvan's approach is the right
one, and I don't want to duplicate his work.

What I'll focus on instead:

- Testing: I'll verify Razvan's patch on my MT7921U (NAB9, 2400m
  altitude, daily use serving real users) and provide Tested-by.

- SEFI/USB reset: You're right that v2 was premature. I'll file a
  proper bug with full dmesg, lsusb topology, and usbmon captures
  first, then propose a fix only after the failure mode is understood.

- WF_MIB over USB: Still interested in your thoughts on my March 12
  email about MT_MIB_SDR9/36/37 returning 0 on mt7921u. From what
  I've seen, the USB variant has several gaps beyond txpower =E2=80=94 surv=
ey
  data, channel time counters =E2=80=94 that I'd like to help close.

Best regards,
Bryam Vargas

