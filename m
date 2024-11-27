Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37722D6D248
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2024 23:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Qbsfa3oGMzg1U/98CAfEMqAXTtrg3Szco6BJfPedmc=; b=cVV9st6a14six8Y8Rb9ABtgICA
	q1mx5eW6LVBdTtzyF435K9/bhACwD/8qJhU3bw1nhWX7cUqyoVgQCRUiXnsK6JOXQPvl/PEf6GiUJ
	odUAk3dDO+ZyjIv5hjErOobx41mRAEzZ2WLWOli8iqmkZK5TUrD3CvgTh9p5quLJEXJ8aCJ7kxcJI
	VdXeTIyqZNLS1EPfjtPXGKh9EzZwFeb5bP9uGzfE9iBWcMTiDvtNt7VvPgRUkyg5hCbDTz6+d4q7e
	hRQr9zJEuPwKhTFlugBpHVcbFck6Oka/pKSxV7WCnSfP4fgJvUEwlaCHbdlV5yX/pAMRtKvo8VdTn
	imWTGf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGREy-0000000EFqj-0sqo;
	Wed, 27 Nov 2024 23:14:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGREw-0000000EFqM-3cHa
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Nov 2024 23:14:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21285c1b196so1923755ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Nov 2024 15:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732749273; x=1733354073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Qbsfa3oGMzg1U/98CAfEMqAXTtrg3Szco6BJfPedmc=;
        b=PXQ0hs6/V6AxIis256Y2dTyAvxN8e21ECHBBo5hJbbmpRiPqvsKsyi1IxRDJgdLu8O
         Klyar2nWcYNCw38tZ8N8aVP3RKrgrvPz6GR74XmFkUeAhfobL1vAXkhGeejLgs1IG4Zk
         z1Hfr4dxlY0rjRHotEe7N3yqZt+Qs8KvHB2nWn94cgj6feSDkeqW98+2vIwHUkuivuci
         wMywKkSUCSbKb4p4m0I7rbVhfxDywt/NfYnJgJrcFj/o2UWrni+o59++h+WLsy61S3u/
         h3dXjHXPfsx5rPQuN6OEf9pV+U2p4qOBgrvSSfJPv+KwNl46LPOH26GxFCI1nsct1Qpo
         f5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732749273; x=1733354073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Qbsfa3oGMzg1U/98CAfEMqAXTtrg3Szco6BJfPedmc=;
        b=kIHNevAvF5cmMe+NKV8rmVzGVQjN6nJdHrfoNE++3PY2mUj+m1P+yiWACuJmmQ+7li
         GVtxkN51IFtmxk+HeDwSgSFE4q2qx7qUXxzVXbh7zJnEho4R5PP0RjZ+Bjza2LhmVqFP
         MpCvPWKgi1ypDrjNd0IqbNZYQBCZn+9qo1c1klG8QU9M/jAGcVbm5zMHkqAlhJMWZsDu
         MKclTVS9uwVq+vYr41RoJUHoeXnEoXPDOBZJj3hWBlSHAMW/J071kwhdqxvWRsdGu+dM
         eX4xQ97alWgo9HUb5iK0ZzU3xqfIGit1zTBziC/KWfhzx5F3dtdFpVoqVBkqBYiK2qIn
         4R3g==
X-Forwarded-Encrypted: i=1; AJvYcCVf6ZQ5qkhaZ5XMcIfMi0o1ixpSm0hZa98bD6Ci/zKQriRy8wmxmrWK0I6x++vzIfDR+H8zdyUP4Ftgrfwi4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdIRAqyYN/Pv+BssgVgtJeIrzWyhYOmrEjoqKbutydbYOI50ax
	q8/QLVZ1S/TAxPNyLHjuAGbSV1h9Y57+/Hb3N0t57Ustk9eh3+2+
X-Gm-Gg: ASbGncvkT8e/XBagy1M5zTFIOdPAeCWEVJX8R7KHv0oVvcLABLVjNjq28sGR7SYnDXM
	o3KolHZAUPAKHr63mL7lSRIBUEF4HHjY6vgiMDPk9fLoA8tj0Gn+k2Uk4c1jfflklk9JlwdrO1p
	FQF62feasmerXMEAhOpG533LcB9FqQRXoCSImTOD6/PF4r8WWEkJiI2UyI8vO1o+6hvREYWDhXq
	FsatR104VfY2wHM/iOMnDPglriWOrPc5Fjl2/DY58OtTSeHXrQ7SAZ0rCIHfkl+QhRK+QwpYRWX
	O4mR1PFA
X-Google-Smtp-Source: AGHT+IG42zwk9rVSv3JinSJ7jGPo3cY4n7KHciWkVFVdIkqCjPRr7Vl0KdkjQqjmAh8XeOcmAt858A==
X-Received: by 2002:a17:902:dac4:b0:212:1abb:fe75 with SMTP id d9443c01a7336-21501f64128mr57312355ad.54.1732749273617;
        Wed, 27 Nov 2024 15:14:33 -0800 (PST)
Received: from amdora.. (c-76-146-136-228.hsd1.wa.comcast.net. [76.146.136.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219c49ebsm903255ad.252.2024.11.27.15.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 15:14:33 -0800 (PST)
From: John Glotzer <jglotzer@gmail.com>
To: regressions@leemhuis.info
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
Subject: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And Hibernate
Date: Wed, 27 Nov 2024 15:14:32 -0800
Message-ID: <20241127231432.8112-1-jglotzer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <643d8055-5a9f-4f5b-865b-830d33651dfe@leemhuis.info>
References: <643d8055-5a9f-4f5b-865b-830d33651dfe@leemhuis.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_151434_903600_339CDD47 
X-CRM114-Status: UNSURE (   7.55  )
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

I've been following this thread since hitting this issue on my AMD Ryzen 5 7600.

People have reported being able to mitigate by either turning off Bluetooth in system settings
or by using a systemd sleep script like the one below (this is the approach I've taken,
it works fine.)

cat /usr/lib/systemd/system-sleep/sleep-fix.sh
#!/usr/bin/env bash
case ${1} in
    pre)
    rfkill block all
    echo "Killed wifi/bluetooth"
    ;;
    post)
    rfkill unblock all
    echo "Started wifi/bluetooth"
    ;;
esac

In following the related email threads it seems that this particular email thread has
not had any activity since 10/21/2024. Now the focus seems to be on firmware download which
in my admittedly non-expert opinion seems to be not clearly related.

There are multiple reports of this issue on various user forums (Fedora, Arch, Redhat, others)
but it seems that we've lost focus on the kernel side on addressing this regression.

Thanks all.

