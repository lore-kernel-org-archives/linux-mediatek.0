Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17530606A320
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GX51meep;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hpeFYIEk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ykhNTsChJJUlt1URM+zfzHn3YiACgwozf/JpK+p7y/w=; b=GX51meep9d4w17
	En9G8z/ViP/J/ZT8n+Plc3iLOcMqNPF+iQc8zphblrMibr1TfvgFl7WZbQX2tvLjxLZDTgS7i22v7
	+fxEucjM8hFyN7IDb6v6t5bV3LM/MaYHwUcTCVxSacOvE7dZVqXoLPC+9GI+rRllnfiJwuOAc/LDs
	x51ugB7dn83HNxJkWN74B4112MXreypvQaHlPOgaPQ2q3VWPTnWN56mgN56Dw+bm4iDQBJpkPK+0Q
	GJCi33Fjg8suichlRwf1X9adpLU+NNSbwlNWhmpi1qW0JfLC7waHi6K7EG8mBrMRGo/nr2JZFT4Kr
	y8VFTN/izRHe9LzkybZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTf0R-00000008t9B-3L9Z;
	Wed, 18 Nov 2026 12:43:19 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTf0P-00000008t8p-1zJN
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 12:43:18 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so557541b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 04:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795005796; cv=none;
        d=google.com; s=arc-20260327;
        b=G4AfW7EW9ribV8AiAP/+ADqJvV4DEZ7Pbu2b789+XdemGqo4xYSdnC6KW2malKP/q/
         wIh0vxbXQamDrUNpdBY0khZyHIjOMvKB8TycrNgUvkTpAPlnIucRyRRDePnKGKygY/m+
         RcCnmU1QUbKbUjGr/z4PcZ9YWewIAiosQIVush3mM5UABBN3Vi9dgwatySP+TjYsr247
         Ea5WL37cjAeDv5rVUvyx/td8GQeirJwFSCOSwaW7GbZIT+QnSvQCBeeCVshzFfH9s+PC
         85htj8LfzXaXdQjsy2kh9ispX0qTPuxeFsIJVzcW4lqoTjtDH1elotQ/7hspvFdMyiRc
         23fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ykhNTsChJJUlt1URM+zfzHn3YiACgwozf/JpK+p7y/w=;
        fh=2ZNBUBY4OGpWl32K/Se7iYqTnj3e6YzuDDqQsbHYpdM=;
        b=JdRx5giRUGYZI2WCehBXks0FbC2OV4+5yNnsnPvmACIlSmYWbzrudtFxYiikuK5VI0
         Nwz6edGHgU8/JptwgSSm7kdBZlA1zMLsI57ZwYVRwvnFuCiqREGnRbIjBQBaXBLzFjLx
         /mruc3jPBp+VTQTy41Lnc4RzcW8eNNcsxYLRQkk24bUZCsOLU4wagDqTs4awGVFM3fzB
         L6iVZhkuVIyCidXWulEXGRxpWTdOAlC7PCp2WFHhd+DVKpn4/pyqpwuzRsVGwzQSajXH
         IEv9RmVCxcEZSo3CBamo4rKPrF/70P1Ud52UTdcgSc/tse1jMNgi/WGFSWDAVIGYNXQZ
         ou7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005796; x=1795610596; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ykhNTsChJJUlt1URM+zfzHn3YiACgwozf/JpK+p7y/w=;
        b=hpeFYIEkRa0GV3eFAkROqKpYxAc6MRpLtseWJF4L+ZuEIkW4/8tYbO2J5VrF32LEoE
         yRdF/9om7vIUV+JjEnnxVpnOgiOqMj2KMmoQJtsQ0ydNWcQkBPjskf5XKbyKLWPfxA/U
         rLFniUFh5zKNPkA1ciqStJhy+c9q6janlG0gD9wUuGZKRRAEWgpX40FTfLKk0ss5StXQ
         HCj8x910ngcI+4jek+jobVna3rTHCB9t/IxkpjhKWOaxupd0VUsCMlpZ590898T+Wsi/
         5Tkb5PQAppxuA6hc+pwep3EF7o0sMPuR8uQPaCvfl0EFxEBm2uz/l4aaEe4w+Vn6PWov
         Jtsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005796; x=1795610596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykhNTsChJJUlt1URM+zfzHn3YiACgwozf/JpK+p7y/w=;
        b=EXEStWWAdWgHjpW94tSKC3Rh/HTV8GOvPbEQJ5qWuDwcdN9bf9SdqGSGo+y18Bp03m
         Bw+MV3iBBYM/XkBGLxtqc6Bfig+ZNFNIBbD7UV46rxIUa3sjoh3FNEMnR4Ys4kw6Sboe
         Yt5QEWQMKecB13Or5G/5Yt5CGs38jwv4AK7+cK5OiV5rck6UUq/CmZig655hajaaTziX
         vrqxbGGAg9zQ6hW6/NJYiVos/ZOZEwVxunzAIBJr/RZXm7QQjA/WPfmUltB+cgItDFo+
         QJmsOVOYb/IuXg4q5DHAHCujIfsEItRToxweX9mSmVlgOT3Q2kBMt6VqWo4WjPv9pCxi
         Qfhg==
X-Forwarded-Encrypted: i=1; AL+hErHUgl8iKXi8t/UcwB6THXHq7RQm9MDeTD3dtYNvb5VByfhQ1AOYM9ewyic9YT8IsecD6I/rKWp8ItUx3J3+AQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9m4JQPIP+AppQ/J9++IESsM69pvDzowgf2SFAlCWEjkGJntG/S
	XK33BjYbMrJGxHPSVSi7X3Ed7UHpYO5/ILJWhhGbzxNZf0HPFju4pJW3T+s1IS64+c55WQ5dLLo
	UkrQQzyVZ8uZBAIa8SWeXF+U5z0EC9rA=
X-Gm-Gg: AYBFou3yKHC8bpZPAwrg6UurHz8/1LT8yN3BFpSzEkxGPiAx7Yrs3lKPCW5mVN+InBq
	fu6u3RB4vUY4/qUR8StWAkDbfdVQ2OauheJbDhOmAPPR+LxcoozFFf2HSI0raxEvsZ/lY5PpLYM
	xamv7EdKPYdKwKLWF8vlGi2oM7tYeR2V7Y7FPhWgu4YGcNz6A9druwD6urZMhqR1ePSmIMSO04Q
	ps1wIb0TB5XunXA92fRmIHak09LaNK8ye+6bg93Jt2nOvH0L3cZaD2MdSjT0IEt5Zi1K73kPMSy
	woerA74LdbpRMfCRL2lrIKoQpSe4Mmr8Gm0ZF2dGnB4/80hnj2x2Vjsw0AvKYuwP7O9hMUV2KTh
	CaOhjuI25Fait/Tf8v/sb2GS/lndoyA5z1q/BiMI=
X-Received: by 2002:a05:6a21:798a:b0:3f9:6c37:4b43 with SMTP id
 adf61e73a8af0-3fe8a0219femr2566464637.45.1795005796480; Wed, 18 Nov 2026
 04:43:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115025635.40010-1-lucid_duck@justthetip.ca>
 <CAHaeJsRTd5KjN9CsKDU-g8Ut-WfBuiKkTnkBSZ9hQSsr7P_HQA@mail.gmail.com> <173fc5e8010e9f01a9a11f0d98d0934c8b8ccc09.camel@mediatek.com>
In-Reply-To: <173fc5e8010e9f01a9a11f0d98d0934c8b8ccc09.camel@mediatek.com>
From: Chris <hoopyfrood42@gmail.com>
Date: Wed, 18 Nov 2026 07:43:03 -0500
X-Gm-Features: AclHuK_uO0t29yrPw6mmFLmOZoUGZqSgOHrTkJfrQJOhwlG-rwXsTHRJw0FHFNM
Message-ID: <CAHaeJsTWY4UOgAmj-F18Mi8CKCMWvQ=d2S8dyF_fyaqiBcxPZA@mail.gmail.com>
Subject: Re: [PATCH wireless v2] wifi: mt76: mt7925: get the survey airtime
 from the firmware
To: =?UTF-8?B?TWljaGFlbCBTaGloICjlj7LlkJvku7Ip?= <Michael.Shih@mediatek.com>
Cc: "lucid_duck@justthetip.ca" <lucid_duck@justthetip.ca>, 
	=?UTF-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>, 
	"nbd@nbd.name" <nbd@nbd.name>, Ryder Lee <Ryder.Lee@mediatek.com>, 
	"lorenzo@kernel.org" <lorenzo@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>, 
	"floss@jetm.me" <floss@jetm.me>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>, 
	"stable+noautosel@kernel.org" <stable+noautosel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_044317_554885_148C28FB 
X-CRM114-Status: GOOD (  17.98  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 2:23=E2=80=AFAM Michael Shih (=E5=8F=B2=E5=90=9B=E4=
=BB=B2)
<Michael.Shih@mediatek.com> wrote:
>
> Hi Chris,
> Thanks for digging into this.
> Short answer: on MT7925 the noise floor is not exposed to the host
> today.
>
> For additional info, the MT7915 and MT7996 chips are for AP. While
> MT7925/MT7928 are STA roles.
>
> I've also checked on our MT7925/MT7928 chip's FW, and here is what I
> know:
>
> 1. It's not in GET_MIB_INFO.
> Neither the MIB_INFO response nor the UNI MIB counter set carries a
> noise / NF / IPI field =E2=80=94 they're CCA/ED/channel-idle time counter=
s
> only. That's consistent with what you saw: mt792x_phy_get_nf()
> returning 0 is accurate, there's simply no MIB field to read.
>
> 2. Why reading IRPI directly gives zeros, and why IPI_EN "didn't stick"
> + caused MCU timeouts.
> The IRPI histogram registers and the IPI_EN control do exist on this
> chip.
>
> Thanks.
>


Hi Michael,

Thanks, that settles the MIB side: no noise field in GET_MIB_INFO, so
mt792x_phy_get_nf() returning 0 is accurate, not a bug.

On point 2, it looks like the explanation was cut off:

> 2. Why reading IRPI directly gives zeros, and why IPI_EN "didn't stick"
> + caused MCU timeouts.
> The IRPI histogram registers and the IPI_EN control do exist on this
> chip.

The mail ends there. Could you send the rest? In particular:

- Why do the IRPI bins read zero from the host? Is the histogram owned
  or reset by the firmware, or does it need some other enable or bank
  select first?
- Is there a supported way for the host to turn on IPI collection on
  MT7925 (a firmware command rather than a direct register write) that
  won't trip the MCU timeouts we saw?
- If there isn't one today, could it be added with the firmware change
  you mentioned for tx time?

A noise floor or IPI histogram is the one RF figure we can't get from
MT7925 in monitor mode. I'm happy to test any firmware or driver change
on an MT7925 USB adapter (Netgear A9000).

Thanks,
Chris

