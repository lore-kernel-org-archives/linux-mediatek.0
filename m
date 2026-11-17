Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7AA606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 14:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U9omauQb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3a4hj33
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rPDYX9H0g1BawO3rTHI9KVIdSs+LnRoUnNvMMbtRxnE=; b=U9omauQbDFHf54
	1HkqOopZCbSMs9bxB6DaEL4HXf3fb8k9ooWdjcqDbcjZVS0gHhCAmMR3CIrmcfbyPj7lnzFYG5ihE
	dH6qI6AjtSmk1gSYzhwjQhyu5IVuYNW8/2nsyuKNhe56nJqjFd9qXnwiVY4YQoYHCVVO9okv3UfLr
	pVbvcBcTS7KK1aycW/Ov7gd5pKY3OVAtD6IkmYxoLhE6TXBmp+YZpkDQOsdMeIkJJ1RpGAH8x47O7
	4h25CNsKz2rla3QIE3WzcQzwdSg+tlktnYNA0W6OKJPmVH7pJAeDpGe+sls3mNIeLLaP/klgshc3/
	W89jJK445F/DRN5X0SUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKe5-00000006F4d-2fa9;
	Tue, 17 Nov 2026 14:58:53 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKe3-00000006F46-0bQt
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 14:58:52 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so2325334b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 06:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794927530; cv=none;
        d=google.com; s=arc-20260327;
        b=l2EEiUDCokbQCkbRyfJENgiQGEiZyrqW1mOll3G8d0UnRLUNY4RWF850cWq3QuxaIN
         5LMg3YWESwhHZtvpuzCea/0RzyffY0AYQVoi0a8HCzq5rY8h5OqZDvFbyFsARbvxAroI
         DYa7KCKd5MA3inIj3+s4LRhAtckzoLwa6hrLVsN6Q4ybpoH455bxqbMClq+Fe0shy2KK
         X509KLN5DKcNDo5Y6EOYIB7C09f2l96QavECH5gPwL/84WLz/Rb7IS/oiEqDdQCN4DIU
         M003jP9/ORyL4mpOHNiu4C5UOFdecKIMp9+e6heHCLVELfVr9N3YXat+Xi6RoxSEYgxo
         Pu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rPDYX9H0g1BawO3rTHI9KVIdSs+LnRoUnNvMMbtRxnE=;
        fh=hgNwgac05RQBbjAmsVG7daMrnjhdP0JrCb14xmINbX0=;
        b=R7CRJFXlgwqQskoQjITbYMMqQnfsXdm1oDWyFSgu/pxGNHoi7WAHIh0Ma2edwTbNCr
         gwN0DfSMxqNenQgbkgRq2l8kCBjoWRzAsManRLKuagKciQXf1xff7QphoAhMuoJyzX1L
         demXJ0bCjPSUlJIiuFi3Sc9F/pE5AlVZ1U/9qOlEDrOYqGy+H2U9GQT2qDn5snJKn/f4
         VSulMcIInEDLLEk8ad8nWdn41VfQfy5Q5Yv8d+xBXa5MthJiWVDsLYVAPHxOVxFk+bbR
         XSWLOhatB9PD0JNS2/4YIW0jo6csa8+l/96AvVPoYzRhfmB/BFM1NIqiObVmbYf4xwAq
         xRnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794927530; x=1795532330; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rPDYX9H0g1BawO3rTHI9KVIdSs+LnRoUnNvMMbtRxnE=;
        b=G3a4hj33pl/R/hQGrPChRbLve1/PPfWGUlZKJPpW0QWrEg49FX/PMmruW+uyUYkN6s
         zLktCyo3gEgYVOFMAeK/JDYzvrgXVqiEg+Ev0np9SFEgxvxj1bLdy+oEuVO4QbW+Q6kl
         0EvPejSoNaDEjeqY9yUKYwYSKBfXVrOYxYTF7kT6svdN7t6TWHeQGO5bRXWECEbfpGFI
         x/GJH5DeMiFySQ6cbRp8Mfczhy+bPN+LOAEtjPzWxedqNu2dRkYWzOL9kgP37pgbAdjJ
         SSmV8l2LCRsAL2pu16z0sS+mSB4vl+RtJHbJv+kcBWe7oP4C6SXtq62pYzpti0Wg4baO
         gLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927530; x=1795532330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPDYX9H0g1BawO3rTHI9KVIdSs+LnRoUnNvMMbtRxnE=;
        b=n5rmNza7P5abMqKDugwz8Lc782YqVK7ZHV4QpMmNOqLTLHWrjqgVyxmd6QdAFII904
         GrqQeGH6yAzNw0JtULGwvvpn8GBPszDhfiutwxEETktW1Dn8/9jo9ddCdzrQ2DD/xRsb
         uOEGL6vhlBX4zrC5PR9ZyCKBCsRZKPWe0hQKm9aQDipP5hp7iapa/CWsI4hY4TOkMH/L
         GFzw2hqgXzhq3psD6a2DtTpdoMx8IMCop0yW38WHiIetd1g9q4BYKuwr6p9DWO1SiuIZ
         IT0PDzGHOXyGEqDVTl0++PK/nUtQGYOghRTGFWf7bL+m5EDX6L1b0Z0lSdYw2UwzjjVF
         L01g==
X-Forwarded-Encrypted: i=1; AL+hErF7qnEsZWlzmLu8sRBYXuniaxifiZ3TzCSCD4cGv6hzSbxd5sxUAFUSmkNXsfYMM12EPxdbRzTg8pFhsWXnfw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+thhvzbGQR7zmpFC7IS/CNfM2gMY30MBACA/Q8FtvRTa0O4JpD
	I7r1NuzkyaP7nEU3lzGm39S7QxlXJVvzShZv1CQXjdEHwrVYYftvEmuOEPAGTDoTDGWATedcu5U
	BBO5A7k+k7dkN2DUVxsmoi48tXvV7+q0=
X-Gm-Gg: AYBFou2J3i6qRNOAjFIzGUMhlcX18WMTHSlgtab5wRr82duoT0umJ6r4cHG91cLVW65
	Z1ASragsX+JtG72Pth/3okprvqBYnqFXMDlZ2IsOOdeUqh0JJn2PLmqp4Igm3lrqbeHxQYk/4gA
	ePDzBFELOtE8PEVAy7SpiOVpTvrLJCNZeqwj7ewjf8BOkKPm3qD9osdZYBv2pT5wKDBlFI8NaZY
	IekRypZwgWEyLZpVeJ4nC9ffz/JA+OK9LV8vdTnojIqNoD2fpZ7XPLTkLPn5KfDH7LTOXfjqa+u
	ntRm0rPi2fYt12bngbQ+IVCL+uPV4oVqE9TkUaoLrbEmigRi7LYOzpjCnR8PmHHVxiVvPcsnPDE
	jZrKaXrd6xFdZORttmZYpuzJtL1h1YQgdvznHwg==
X-Received: by 2002:a05:6a21:7e87:b0:3e2:891b:c50f with SMTP id
 adf61e73a8af0-3f7a71c513bmr11027784637.13.1794927529599; Tue, 17 Nov 2026
 06:58:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260831032832.83338-1-eason.lai@mediatek.com>
 <20261112075558.1813785-1-michael.shih@mediatek.com> <20261112075558.1813785-3-michael.shih@mediatek.com>
 <20261113150048.5271-1-lucid_duck@justthetip.ca> <644ef5eaf8cf84f5760691ffe9bcf8e7ac8b9f69.camel@mediatek.com>
In-Reply-To: <644ef5eaf8cf84f5760691ffe9bcf8e7ac8b9f69.camel@mediatek.com>
From: Chris <hoopyfrood42@gmail.com>
Date: Tue, 17 Nov 2026 09:58:36 -0500
X-Gm-Features: AclHuK9Pzpcw2OgK_ABRSF114EBt_4pkWN3NuhgG70kUz-EjTXmuHflRHxj__bQ
Message-ID: <CAHaeJsTYEi=T-3r_ZtY6-WweH6Be8C+v5euttsLSmbAg1fKBZw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] wifi: mt76: mt7925: support per-channel survey
 dump during scan
To: =?UTF-8?B?TWljaGFlbCBTaGloICjlj7LlkJvku7Ip?= <Michael.Shih@mediatek.com>
Cc: "lucid_duck@justthetip.ca" <lucid_duck@justthetip.ca>, 
	=?UTF-8?B?RWFzb24gTGFpICjos7TmmJPogZYp?= <Eason.Lai@mediatek.com>, 
	=?UTF-8?B?TGl0aWVuIENoYW5nICjlvLXnq4vlhbgp?= <Litien.Chang@mediatek.com>, 
	"nbd@nbd.name" <nbd@nbd.name>, "lorenzo@kernel.org" <lorenzo@kernel.org>, 
	=?UTF-8?B?UXVhbiBaaG91ICjlkajlhagp?= <Quan.Zhou@mediatek.com>, 
	=?UTF-8?B?S3VuIFd1ICjlkLPorLnoh7Mp?= <kun.wu@mediatek.com>, 
	Ryder Lee <Ryder.Lee@mediatek.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>, 
	=?UTF-8?B?TGVvbiBZZW4gKOmhj+iJr+WEkik=?= <Leon.Yen@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>, 
	=?UTF-8?B?SkIgVHNhaSAo6JSh5b+X5b2sKQ==?= <Jb.Tsai@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_065851_186631_6A7986A4 
X-CRM114-Status: GOOD (  17.55  )
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

Hi Michael,

Thanks for the explanation. A related question while the firmware
change is being prepared: we can=E2=80=99t find a noise floor reading for t=
he
MT7925. mt792x_phy_get_nf() returns 0, and the idle-power (IPI)
histogram that mt7915/mt7996 build their noise floor from reads as all
zeros on this chip. Setting IPI_EN through debugfs didn=E2=80=99t stick and
caused MCU timeouts and firmware reloads, so we stopped there.

Is a noise floor, or the IPI histogram, available from the MT7925
firmware, for example in the GET_MIB_INFO response or another MCU
query? Or could it be added alongside this change? With it, the survey
could report noise as well as busy time.

We=E2=80=99re running an A9000 on USB 2.0, mostly in monitor mode, with
firmware WM 20260605184805. We=E2=80=99re happy to test the firmware and
driver changes when they=E2=80=99re available.

Thanks,
Chris

On Mon, Nov 16, 2026 at 9:51=E2=80=AFPM Michael Shih (=E5=8F=B2=E5=90=9B=E4=
=BB=B2)
<Michael.Shih@mediatek.com> wrote:
>
> Hi Devin,
>
> Sorry for not mentioning that this Driver change requires MT7925  FW
> change as well, this is the reason why there is no transmit time with
> this driver change only.
>
> I am also preparing the FW change on MTK side, and the FW change will
> be provided to upstream on MTK's FW provision schedule.
>
> Thanks,
> Michael.
>
> *********** MEDIATEK Confidentiality Notice
>  ***********
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or
> otherwise exempt from disclosure under applicable laws. It is
> intended to be conveyed only to the designated recipient(s). Any
> use, dissemination, distribution, printing, retaining or copying
> of this e-mail (including its attachments) by unintended recipient(s)
> is strictly prohibited and may be unlawful. If you are not an
> intended recipient of this e-mail, or believe that you have received
> this e-mail in error, please notify the sender immediately
> (by replying to this e-mail), delete any and all copies of this
> e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

