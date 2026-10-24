Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356F7606A31A
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2026 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MvKPpa7Y;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MqJ6ODRM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5aZKiMNsNuKoIYNElmMYyQbFoWSz4nPaUddhoQAfS7E=; b=MvKPpa7Yw/GE5UxFeA0CRNqj/b
	zVzkx29WMGP1CpCBKh8DjNOdRRCAB8zvfJOjI7VfuN/+KqJ9QxU00hf4pMWVTJwGjv67LfU88zdIk
	ivCigsdH8k8h5iKOuY1eEzyN8wBn3EwI1f92G1QuVrOiu2p31+sHzy5Hf1nYOlft0/PvttIeuIHhp
	bxzGd5ug2ksyBquNWYeAbX5bqSmsGreANmkpcDwcBTztw72yrM4sOLOZTyL6scqsWQ9QzSFtDBQvM
	yw7E7zAI+UR86OGcEibROjJBNxMLYc31q0ojWHZ/5OPEsaJ0zoo/40uQ6B3NWeCpGh+5coH2lBRLY
	yKeCPZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdRp-00000000JFL-1pSk;
	Sat, 24 Oct 2026 15:14:17 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdRn-00000000JF1-25YI
	for linux-mediatek@lists.infradead.org;
	Sat, 24 Oct 2026 15:14:16 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-67921b515a7so1700429d50.2
        for <linux-mediatek@lists.infradead.org>; Sat, 24 Oct 2026 08:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792854854; cv=none;
        d=google.com; s=arc-20260327;
        b=NCR7VUnNWCBKm+AA7HTxkqkAL8Rn0OFGfA4YYrphpwBMuwx8ulM7gru5+SDhc+qr+T
         8V2BnNuQ3rz5sxY0FxYsgo61GB26wZN3ToucdIq3pqQ724msoiDmI9mJHUdDmghZXE80
         FDEaFBu5g/cL0EBVFRtEkYn3x5M8H3K3xycFFrcTgG/O0BW3oJJzUNxR3df+MTCzjblG
         qQ6+BXkpfOJTRn8ZdhOx22yvZQNQr71wiA1mCkfOix2tZssVhDHSDhgBAqzYmxnB/Bc8
         SA5354cxWhWjWpQZDqU0U3H0B5Xye79aSA3OK4b+HmpaZ3YLXB9puXZxWyVQKUcsmnoo
         cfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5aZKiMNsNuKoIYNElmMYyQbFoWSz4nPaUddhoQAfS7E=;
        fh=xpHjsBysSrINoG3tb5B1vMmZAJxpeWsk98k6xjnX9wo=;
        b=h6epO/R45Te3XfIefs9cS+quseQJ9Ys27LSPtsaxxQEGkEs7jvlZFL4r/cvgKf666r
         iDbq28vL6jbFhyTlje0F2E+ETJda1I4lMcG/kvSP9R2KsOTfGjLGH7wkiy/SsrIhrXqg
         W8uQeCMoAtu+uJIq+xc4Njr6QAyi0Rn1uAgBSwxQLFhSXVM2V0WpElGdTphlvBQULQnQ
         cg/yDQtXJJ0siOyhKEyp9fysonHEEqtfqF+5o75Ls/So2sDrC/SyOV16FCYLQb/PF6ki
         znfMbwkTifORf3ou2t5Pruh3NWuxu0oTaHlxC70vRSMKx39Rbbo8c3uWVaILA6z510zo
         VWMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792854854; x=1793459654; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5aZKiMNsNuKoIYNElmMYyQbFoWSz4nPaUddhoQAfS7E=;
        b=MqJ6ODRM6dkaBhdgltMkwP8lEX8ckS3+aTCTC7g3ZSmmsu0Gj+itT1EoEss3h54mCG
         nB8z5VBpP7jPZhDHVR/4mOMzddPuWlOG/uIxEtEKIWgbPiXNh/e2p4lu5JrW77hXWOCM
         62S+NYZOPR76V0hboC4BhoAMUeGZ9myHFwCrj7WM9FaYR9jK4iOD6TZnrhwb9dMgIb27
         W/I6CUmkwGz2nMkgwJVojsKkrVywLF5rcizc+DzaaOFJGe4gT85DBSD7XmB/hIf+glaI
         Xz3l0xnyFBGibcJW58PMK65EtjSMWhohVb/t1/5ryqPPXB6z1U2ibLkD0iZifhteeGMO
         29tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792854854; x=1793459654;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5aZKiMNsNuKoIYNElmMYyQbFoWSz4nPaUddhoQAfS7E=;
        b=Bm4lbnaNsOLFowKmu+vQ+IvmtS/k0ccWbVF36pIgl4fxbM8LICdximJqbKhhuNALLS
         5QvO90Nfc+ljz8s+hIfCwJzhUFC0d4VUpIFdRCkSK2SJGpltwlV6nLIaXxa2TSe9ops8
         uSYPmTtnN4CBBXtSng4TuizlwTbAGwgbDS82/9k8jIu7OESUhr1eTc2joZ5qHEbKELdS
         gmofJAJuhjgad2N/zDRQFSOwQbAnO+eqkDcti+dmMkD477Kdcg/8lZm7sBZv4p+Af/r+
         AKZ/scMMCwgps91tUji5rzKSrKW62V5xLfiX9jgjc66mDVvXnC9IlHOvBR1HOdpumfX9
         U0mw==
X-Forwarded-Encrypted: i=1; AKwUvBwwxTcLc91SwGGIERZ4hWsw9+jJ7FWta6FfrVrGH6zNtg7/kno6PTxREXUTio+EJitJYBAMIDPyP9yAaPp2kA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKFr1OFnuFAGcWfRKU44MuNPE7I4EvQhmSB8dVauS2KDOMVyvcL
	EAsabJJrmAfwuTB5J4Wn8mMivjZCrag06pu0UzvcrDIJibFA4/ik7fBy7FhzKrI34yGGRY+xNp2
	nMgP69pC4mW19useqtHYURPwu+96N9OgPywJAuO/htg==
X-Gm-Gg: AYBFou2pIf58956EL3AFbrJQ3j1dF7z+Zyu5YGJnfYaqAc3qfhkNtCpjB15I8GPPGhO
	+HCg4tynp1xXTo1WgAEFMdFMtRa/2K9UxQ7q9alv+6ztPSyk9CUXH8J2PUfNJtFQfAU5GcgFxfQ
	llZMhXyithlmVatanx0luUk0TSnsRXuvcOMqqPoI9iLhtSFeq7uo2Cf03NnncLqzrLLbGrjlTjq
	WDJyRHrNVlwyb/SMdOfqsZ0KAScfHX8QX/6PRcEW+DruB39XnMyjlvdOGN/c4iemHkd/lORD5Mt
	PNApJRVhj5jesAG8Mp0lBwlrVrwxu0crJ8Lw7A0eQPdsWLKgIY1ZfGorIlv4OGqqaEc8CFdn61M
	9RbwR9+qxcTD3okO5xGIQorn+rS+OrDVQ1OIl
X-Received: by 2002:a05:690e:d8c:b0:679:c4a2:8bd3 with SMTP id
 956f58d0204a3-67a453db9d1mr1506244d50.41.1792854854115; Sat, 24 Oct 2026
 08:14:14 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Hedi Hamida <hedihamida096@gmail.com>
Date: Sat, 24 Oct 2026 11:14:02 -0400
X-Gm-Features: AclHuK8gSz0-ZRGHS3FgSF93zaOok558gy07hn_qlQbIKVtCMTWUA6GyuJJCEQM
Message-ID: <CAOjjH0397TDVqnOgwXdFg5LjvSQ3t_19Q-GjY4d9+-dXx-1JdA@mail.gmail.com>
Subject: [BUG] mt7921e: HIF_CTRL timeout after S3 resume on MT7922
To: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, JB Tsai <jb.tsai@mediatek.com>, 
	Quan Zhou <quan.zhou@mediatek.com>, Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_081415_548709_4DC06673 
X-CRM114-Status: UNSURE (   6.93  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hardware:
  03:00.0 Network controller [0280]: MEDIATEK Corp. MT7922 802.11ax PCI
  Express Wireless Network Adapter [14c3:7922]
  Subsystem: AzureWave Device [1a3b:5916]
  Driver: mt7921e (mt76)

Kernel: 6.12.113+deb13-amd64 (Debian 13)

Firmware tested:
  20241106163310  (Debian firmware-misc-nonfree 20250410-2)
  20260724143402  (current linux-firmware, 2026-07-24)

Problem:
After suspend-to-RAM (S3), resume fails:

  Oct 24 09:43:17 kernel: PM: suspend entry (deep)
  Oct 24 09:46:11 kernel: mt7921e 0000:03:00.0: Message 00020007 (seq
13) timeout
  Oct 24 09:46:11 kernel: mt7921e 0000:03:00.0: PM:
dpm_run_callback(): pci_pm_resume returns -110
  Oct 24 09:46:11 kernel: mt7921e 0000:03:00.0: PM: failed to resume
async: error -110

00020007 is MCU_UNI_CMD(HIF_CTRL), sent by
mt76_connac_mcu_set_hif_suspend(mdev, false, true).

What I tested:
1. wait_resp=true: the command times out as above. The driver then
   calls mt792x_reset() and Wi-Fi recovers, but the PM core reports
   the resume as failed.
2. MT7925-style event handling: I added a handler for
   MCU_UNI_EVENT_HIF_CTRL and sent the resume command with
   wait_resp=false. No event is received at all.
3. wait_resp=false and no event wait: the card is left unusable.
   It reinitializes/reset but never reassociates:

     Oct 24 11:01:17 kernel: PM: suspend entry (deep)
     Oct 24 11:02:11 kernel: mt7921e 0000:03:00.0: HIF resume sent
without waiting
     Oct 24 11:02:11 kernel: mt7921e 0000:03:00.0: HW/SW Version: 0x8a108a10 ...
     Oct 24 11:02:11 kernel: PM: suspend exit
     Oct 24 11:02:28 kernel: wlp3s0: authentication with ... timed out
     ...

   Only a reset recovers it.

4. S4/hibernate: the same HIF handshake is not used. A .restore
   callback that skips it and resets the device works reliably.

The latest linux-firmware 20260724143402 behaves exactly like the
2024 firmware: no response, no event.

Question:
Is MT7922 firmware supposed to answer HIF_CTRL after D3, or send
MCU_UNI_EVENT_HIF_CTRL? If a different resume sequence is required,
what should the driver do instead of resetting? Is this fixable in
firmware?

Workaround under review (reset on timeout):
  https://patchwork.kernel.org/series/1192671/

I can provide full dmesg logs or test patches if useful.

Thanks,
Hedi Ben Hamida

