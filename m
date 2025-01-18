Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4E8C02185
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jan 2025 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1y0ZCBBg0Ud34GfVfOi+9b944wjZwzsnzcdabcPULM=; b=z6JXKE5gsUg/OINCbW4ptPCw1T
	i84i93I6R/yaSx6LO+2WH+Pbqi+nfV6XCZ9dlbvb8WgEwYfX5pMlv8mnbQxCunJfJk0uPT/0lnAMD
	h41HeJYFZaE7BNAhpZLkQrnwNH5lrTD3Bu9GY9Qqrp6FlGrS4dLsg/JY0zflJDPEcHp5qpxKX/+46
	5a9bKpsCYIjmBzlEQLzWD1tCx+wGp+q7DLq96lbvA5duw1FJ12EN3D3umCLz0BI5wu1vf5ZtwsmNx
	fO5Qse7hE7iEFzzsG9e6LxVFQzEocLANw6+xMkGdPRMGzbXvMhcW+rULs6ovpd52MmT10N6qEl3e4
	3FE9/zkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZC9s-00000002jaS-3kBk;
	Sat, 18 Jan 2025 16:58:52 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZC9p-00000002ja7-3UrY
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Jan 2025 16:58:51 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-71e36b27b53so1718747a34.1
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Jan 2025 08:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737219528; x=1737824328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1y0ZCBBg0Ud34GfVfOi+9b944wjZwzsnzcdabcPULM=;
        b=SmTDjJqZqLBU6m5GpQXqGzH2L8c3AnotBasJhvKNAaf1D3sH3oCXp9fleco7zEbPse
         6ycBhuVlgQ003Aj820DDEKrKo1KSr2AjDYjXAXHuWX3N0dxWLE1MdA6uc9EF4odqMWK5
         MbkTS+9xK04tvE8wocxLdiBJnc+Z6KaLk0AjLjyIWAEmJ8d3I6WzP4VeEMpz0NJEXM+o
         bpS0IyPUzsnVFfrr4Ct/9Hb0kq7uU0kCBlc/zXXNrVAL8nNIslXXEBYEKVYOCkdIXLhB
         QD+uxVuV/dPETo1PwSktsjUFB0wPpX5ilP37P9zVsuGwW4hSuWqWijBIAW+2yz8TCm+4
         7Rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737219528; x=1737824328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1y0ZCBBg0Ud34GfVfOi+9b944wjZwzsnzcdabcPULM=;
        b=tpiCoU0ug5RHlNXh1K71kyKU633ntH1mMkVBV+xkIebmuCW6r/sqkOZWpbgw9AlwyW
         bKFCn931GP62Rg9PsyVDu2E/4H9wR41u1sTMULoD77FByy+OatTCnkxV8I/ku5iSWu8S
         L9AbUYvE2nXjAMkqZCrNr2zRONato99GQS1rEbEQ52RH39EDXh5KhVf2hz2QXstXavaL
         aReuPBWb2ucP+3BPIYv82fCDXCjL4pE7SuSbV4swPlzIoXIHWRH+dzTs1tTNfG+q3WvL
         bTzeLTU1qTJTHvElGVPzTbMJPFFtwBoe3aEODRACTQ2ikiqPtGvTzKECmvfgJq9jOym1
         alkg==
X-Forwarded-Encrypted: i=1; AJvYcCXUZyhH8KcF7utFADB0tHrEfPwTOR9Nm7iIMP90jvIQh5JywJWvk6ilWEXP/shi9i7HMo+2aJOYAdXGShUlAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzTaUT2wz1iw4DFKTvkywOz5pHtFtGX6asnPwzBa/lyRzxmBUp
	5MJannUyABBRFP1UbaJV59QRhPx5Vvdc1A3mdJgaAHttj3RgIwSR
X-Gm-Gg: ASbGnct/G+HdOJBLz1OMITL1xMI6SFgQkgmygEZxUNtxtURTwJqwc1MmXOFsQJzy9/O
	ROQV06DuCkt5J6YthnmqawoMFR880uVqCG64Bl2I1gQq/GihGtep0GQPw0fHvJqQ6HhMuK4kiDt
	ocusGb8l/BRAcr0LiWhqA3XT49BONxqyOERB4bL+d2BcQbOKYU8NT6OFldDALPXZkQgHyNefxSu
	pnpk1IGDUiwS0YuqXJOFz8ibHgjPwPHH6N6bxNC5XaWeBsZ2zbi6LlzOZz9wilsbmyuXUm/zGHh
	1zOP
X-Google-Smtp-Source: AGHT+IGbP27AbbOClCTCIkR1cnDE8YRBZyPTtMGJMtWHw/+weozHCb/XJ/XWVucTdPdjgwFMUv7eMQ==
X-Received: by 2002:a05:6830:90f:b0:71d:6221:d4b7 with SMTP id 46e09a7af769-7249db0d787mr4159608a34.28.1737219528177;
        Sat, 18 Jan 2025 08:58:48 -0800 (PST)
Received: from localhost.localdomain ([23.151.240.73])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7249b3ac6f7sm1589013a34.27.2025.01.18.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 08:58:47 -0800 (PST)
From: John Glotzer <jglotzer@gmail.com>
To: sergio.callegari@unibo.it
Cc: Aaron.Hou@mediatek.com,
	Chris.Lu@mediatek.com,
	Deren.Wu@mediatek.com,
	Hao.Qin@mediatek.com,
	Sean.Wang@mediatek.com,
	johan.hedberg@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marc.payne@mdpsys.co.uk,
	marcel@holtmann.org,
	regressions@lists.linux.dev,
	steve.lee@mediatek.com,
	tiwai@suse.de
Subject: Re: [PATCH] Bluetooth: btmtk: Remove resetting mt7921 before downloading the fw
Date: Sat, 18 Jan 2025 10:58:40 -0600
Message-ID: <20250118165840.73110-1-jglotzer@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <9ae25475-e8f4-4ee1-8022-7621fbe8ebc6@unibo.it>
References: <9ae25475-e8f4-4ee1-8022-7621fbe8ebc6@unibo.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_085849_876713_E0D03F5D 
X-CRM114-Status: GOOD (  19.12  )
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

(Note: additional discussion has taken place under
Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And Hibernate)

Hi,

I have dug further into this issue and I think I have a root cause analysis that
makes sense (at least it does for me :) ).
The TLDR is that the root cause is the following commit that was introduced with the 6.11 kernel.

https://github.com/torvalds/linux/commit/d53ab629cff57

Furthermore, the problem must be the call to usleep_range() in
drivers/net/wireless/mediatek/mt76/mt792x_core.c as this is the only behavioral change.

Notice that this commit first shows up in v6.11-rc1 and is present for all subsequent releases,
which matches perfectly the breakage pattern seen by the user community.

What, then, is the evidence for this?

First of all the entire community has been unanimous in the observation that the issue
started with the 6.11 kernel. The universal experience has been that any kernel prior
to that had no issues, and all kernels starting with 6.11 were affected. Also no attempts
to mitigate the issue in code by attacking the problem via the firmware download code paths have
been fruitful.

The next piece of solid data is outlined here:

https://github.com/alimert-t/suspend-freeze-fix-for-mt7921e

Here the lead paragraph states:
"A suspend/resume issue occurs on systems with the MediaTek MT7921 Wi-Fi adapter when
running on Kernel 6.11.-. After suspending, the system fails to resume / freezes and requires a hard
reset."

The mitigation for this issue has consisted of one of two approches:

- rfkill bluetooth and wifi on sleep and reverse the process on wake
- add the parameter mt7921e.disable_aspm=y to the kernel command line
(anecdotally I have seen reports of people doing things like turning off bluetooth
 and/or wifi before suspending or for that matter rmmod mt7921e before suspending).

I personally have used both of these methods with a sucess rate of 100%.

The way to unlock the puzzle is to examine the 6.11 code with an eye towards
- what changed between v6.10 and v6.11?
- what is the intersection between this changeset and the disable_aspm paramter?

To cut to the chase the answer to both these questions is just the contents of
https://github.com/torvalds/linux/commit/d53ab629cff57. I confirmed this by
diffing v6.10 and v6.11 and then going through the diff looking for disable_aspm.

The following lines were added to drivers/net/wireless/mediatek/mt76/mt7921/pci.c

	if (!mt7921_disable_aspm && mt76_pci_aspm_supported(pdev))
		dev->aspm_supported = true;

The bitfield aspm_supported was added to the struct mt792x_dev in drivers/net/wireless/mediatek/mt76/mt792x.h

and if this bitfield is true then the call to usleep_range is made in  __mt792xe_mcu_drv_pmctrl()
in drivers/net/wireless/mediatek/mt76/mt792x_core.c.

		if (dev->aspm_supported)
			usleep_range(2000, 3000);

By setting mt7921e.disable_aspm=y on the kernel command line, this code pathway is avoided
and no crash or lockup happens when the device is woken back up.

Disclaimers:

- I don't claim to know the root cause for why the call to usleep_range() leads to a crash or a
  freeze.

- I don't know the details of the specific issue the code for commit d53ab629cff57 was designed
  to fix, hence I don't know the consequences of removing the call to usleep_range(). However,
  I do know that the user experience has been significantly impacted negatively by the introduction
  of d53ab629cff57 into the 6.11 kernel.

Thanks for your attention,

John Glotzer


