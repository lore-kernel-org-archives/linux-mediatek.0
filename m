Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA53CA0EED
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Aug 2025 14:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WUMPC8fcE10JCTYxxBeDrtmZAukYnv1xny/Hrq6FOHs=; b=DGHDkazCq/4y4m7HGOy39o0Pt7
	7ZAFo/zZveanXp/02fl+ewzx7MNSSJBhznS+SbbwdFVhNQSCXWm7wdO37z87A2XV4Xqu5Y1vLJI21
	bbtBHonujkPbz+1hW7/54FXhv79ZZfZOZactLQfhgOq0bNO28vvLCR+UuSc9FKf0BqMpy/b0VQYnh
	NLB75FPR+8enETRADLQOy15Nv8RUODKI7wKSeloHqSCCLA3afQhYlJpqunEhkEBRMFp6Zxkg87uGh
	uOrNL8CYb1LoV/qBBOjWnyrJIrF8Ungdhw4F76ZLivarHbogufgPV39Wz/tevwy7NB0ahctj9SKQl
	NBKJVg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uposX-00000004pQK-25YJ;
	Sat, 23 Aug 2025 14:05:57 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uposU-00000004pPl-2Z50
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Aug 2025 14:05:55 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-61c20e28380so2550807a12.1
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Aug 2025 07:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755957952; x=1756562752; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WUMPC8fcE10JCTYxxBeDrtmZAukYnv1xny/Hrq6FOHs=;
        b=IvA1Ke1Lsl9d6WrfJ/tFGQgpMl72BPbZo5hdWLIxa/x7waaW/sTsA3k7g6Xgj+AfO3
         stR5lIkYh/TSgJ/CDgF62XoZfXBt+xUzVimGPoAJX0Xa+qe5gzx8rtyZJ9ZSsgN86o+E
         zmRVJZxwEsHcAMXulcWACUP/pg6M1a7UjvHTRxMcxMr/nVXbMOWTFIctfeTbC/k4t8hh
         66Ob7h+v1P2cBeGgglDVp/J1at4uSQt9pJdZ62iQXSyXcaY34kpj4P2aOKj9wayJXc8k
         tsOnmafO+feFS4GrzhI/Z7BFdQMoazFUXoKTHu1ksuS6upJbR/0n2luTFQUGfAcaEUie
         iK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755957952; x=1756562752;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUMPC8fcE10JCTYxxBeDrtmZAukYnv1xny/Hrq6FOHs=;
        b=Ye+pGJiejVS7wtWmmv6vkohuV1P2QHwPX6Vj0Butwx+vD6OlOpJFjFQ8xRAZwj8S2L
         ddsTMBOdHPtA3WGjgujqSXJh26hb75yUVbyqJh3If5BURL8ArS6fhZRKzNXS8KRrudGz
         jJJX7y5wNXqLmHPSsNYNGO4vMu27h/gQGvzO37UFqRwg1FIyKzHNtAMR3TeydXV1XJAP
         dfGv040tKsCD84slTL3sDEnQhbysTd23zP9pJxvAmrqE7WppzUBWygyPF4q6XcYj0v0t
         uP8wia6xGfWZTVqjyVD466BSkUSKr2LLVdMwlW1QysdnQ+SKwAs5OdbCXc83Ba+uo1Ik
         Pirg==
X-Forwarded-Encrypted: i=1; AJvYcCXA7zyhPlE2ovo8oJibs8lGqn9Pogsx57r1wY/rE4z/uU4snl4iiF/0CjpC29x7VbY+6i4zI8QRcV1dN+MwAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtHYpohJYvMZrhuvgQ9/AVKBLhX+I7/CH7irpKXsWnr2Sh5q+T
	5Lz23Tcf2u8Ks2plTnfdWOGK1cqgE8IfLOh/49PyCgc3v8JHuCI/HPVT5alUP3izjSVFG6Z0G/I
	GFkb7OvMnEiqmX1+56oB4K9YjC83zV0o=
X-Gm-Gg: ASbGncs/YzcT0ai3FtAEOTezStnTlG9/NRtca/wPBykyg2OlSikbFPKNG78WfWXrAIb
	CeeyUHAn0jI4z4eu3MybKb3eVzoSiubWQF8IVHzwjjTWLxCPVoIz+mSApiWwj9qqHrDRl5iMK7i
	PwFgEqKZLY4fHVCBGhjgyeQXQCUgAl5c8U0wpVtOynNVuRtd+8EhNkRu6fPgjhVwUc9rF3aH1RS
	TmDAgc=
X-Google-Smtp-Source: AGHT+IG+sM1YjzuWt+dAD2iioZRu/JngAJr05F1DV7lmK6YatPlAJ2bSDfKyhK5IjkJGbFWTFI9vaghccM+p2pHmJ4k=
X-Received: by 2002:a05:6402:21c1:b0:618:28c3:aee0 with SMTP id
 4fb4d7f45d1cf-61c1b45c454mr4815610a12.8.1755957952266; Sat, 23 Aug 2025
 07:05:52 -0700 (PDT)
MIME-Version: 1.0
From: Zhi-Jun You <hujy652@gmail.com>
Date: Sat, 23 Aug 2025 22:05:41 +0800
X-Gm-Features: Ac12FXxEkyjkOsaHAErDwu055kU3cvPBf_YFKYBQEhdjKyTT45dT_sQ0Tfm94Yw
Message-ID: <CAHGaMk9FOEg3L5Dto87JJLRrsptQbac=trm2e4m=Xh65dxiC-A@mail.gmail.com>
Subject: Question about mt7981 precal size
To: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_070554_665419_57E57F5E 
X-CRM114-Status: UNSURE (   8.19  )
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

Hi,

I am trying to convert my device to read EEPROM and precal through
NVMEM but encountered a problem with precal size.

Based on documentation and 19a954e, set the precal size to 54K + 16 +
102K = 159760 but I got a warning saying it failed to load precal and
the size is 200720. Added some debug line for the precal sizes I got:

mt798x-wmac 18000000.wifi: group size=96272
mt798x-wmac 18000000.wifi: dpd size=104448
mt798x-wmac 18000000.wifi: precal size=200720

mt7981 is using 2.4G + 6G cal group size but why? Then I took a look
at the vendor driver and it's using 2.4G + 5G + 6G cal group size
which looks even weirder.

So which one is the correct size? I assume the correct size should be
the same as the vendor driver but I might be wrong.

Best regards,
Zhi-Jun

