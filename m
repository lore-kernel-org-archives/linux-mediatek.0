Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DAD606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a3Iph43b;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpEm9CJd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ShgkFsYCqowMz/8lzOPU+bXKkKKW8/M1AiC7aaKs/pw=; b=a3Iph43bddjWQR296oerQvrVeK
	4lT5265j+rI0FYmNhYMXAN2tvjRL1Gewq19IIkU2YgTFmrQVvvRNxjPHuuLoA94UUgz1xak4eUSCT
	yN54XADoNKE8eQQf7G/6YqzRqT6cs7hlHYvlpXETPEc4RzehybueapArP3SzqDvGH+xdvqz3y2pNr
	ZogD4+RGUbxoLU3kiK959E8gZSiUe+nNIM7joU5O9onuXUFbU3DVYPumvqI+EaGyw/kFD+Oi+WmJz
	wkh2Kx7aB8N7TbXH6aXUMxh4Yi2QsU0O2W7had5w7VjRLByfr8OUTZ1Rdjk/AA1ADnQq5rgNyaTpt
	0+6M7khg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtuN-0000000Fl3c-0rad;
	Fri, 27 Nov 2026 11:14:27 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtuJ-0000000Fl2r-3BFW
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 11:14:26 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso8270401d50.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 03:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795778061; cv=none;
        d=google.com; s=arc-20260327;
        b=qx+YJPUBywbJ8RgMPYE0fO9zOuWZZc80/6AwPKVhusA1NSeiugxtpKEWxOqqYYCQxM
         MHBG3c9c1eMjpc2d1zU7pA1OumAreu9i5g3eDzb0UUPMf2oI+U+gToWtyXbgfXkvswdK
         RjJFlhgOJ65c5HmfCZ4nPS4k9Uym7TAg13Hzv+fZnaRM/LHi+CQ2Ay8ynz+fj1AMoN8w
         AIpuPMQyG4ectRbTg5N66e9sOsJoT5v1TuE6B6lK3k28CLoFZ8d9b2yDCK+8EoQ93rsQ
         QMCbQhef+FLuP5/7D81kFfdg4WoS6kIoLLx8jX2+2xrmX0MWN7ZuIrEmeSUCCo7aChQ5
         Vc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ShgkFsYCqowMz/8lzOPU+bXKkKKW8/M1AiC7aaKs/pw=;
        fh=7q9slQwJZ94/e6e481MFJgYPeNForZhGYqL2OGSLeAY=;
        b=IYQX/TMNvykL6xUWIEZo50DO0OMT6PQd+YGneqMlVqQthmB/892IO2Ach8bK6SGJXx
         4dy36tz+eb8DayyvkuRLmpj/yWHXZ5MI/ZCnQhHKwQf5Oc7/83A4Krt5tzZJOb9yhVX/
         C7m+2AbVpO4vsQpan55AcS1j+3T/LdFea2SRuboTg8A/w6t1/mUsBvy+y505w/9X3uGb
         LpaTsEYOJkyhGxgdgxQKVzqjZY43REhmz4PAA8wGUb1sWgqcIs/aMqUHJpejCiZSfOwB
         1Ql7uLc2qB9n9hnGHCmWJkrLgt9CWNDgCw5GVhr6mlckpc+Dt0d7yr7mK2wUVGWNHO/y
         LEbQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795778061; x=1796382861; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ShgkFsYCqowMz/8lzOPU+bXKkKKW8/M1AiC7aaKs/pw=;
        b=WpEm9CJd+oyeoV1XbPsC//Kw0nhhRmi5zxgMsXTOwPz/I7qCSZpfQ2HnzdiOnivar9
         bGOBMMGXmCHHlgrdBmWCrtQ+C2h32ua2TmuXxcVD1XelZFBuHIWw0Kyko7fnCDLHpJam
         QpWVcMZ65ctgT8zCZTVOu7j0IyBSlTl7mo0dP76KyVWAR/K0N8n3NglUNygkwkwJrJ4l
         Wa0Cy9nfws8RitlSDvRwSLYCLHQ1iFRq5WTNpWv/0j/r8PCBjn4kUwGc0eM/GccUeAON
         sMdEYduuotn7y/lq+mQv/nPfcjfzXWsGJHp7+cNcA47UcQickPucjk6+kYC0Ac+DyP2t
         RiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778061; x=1796382861;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShgkFsYCqowMz/8lzOPU+bXKkKKW8/M1AiC7aaKs/pw=;
        b=hp16knhjhBuOfTYD6NX1+wPBE1/TyFDW8xxoUJAs+UMO8qLfQPAQTdB5yN9YbDvy/r
         TBPpyxerXPyqUx87w9blkHgiUPXNtLGneCpZNmwAwDpdw/C93J+owcqGVGjuTNJunMlJ
         +388bPrufuNMAJ1Ompb5dxzv+wigVPCBai2M3++YGMtanne8WWhiYvpMJY6WPy0pHrhW
         HvPub7/GmYbf6d7O6Mhth22gSrH7YsWjwxGzjEikaglEkFTEXQVYdl8nYkU77jE8yn7w
         Hdmo5qJ/POPdEN8s/8oMZfQ0KmjiL3qIpIML7lp7uiEzsWypCpmzHpfb0NZtwtVxVYy8
         i67w==
X-Gm-Message-State: APuU4Z8//QtWdWg48FwKz+leiLkEdW1x4Jp1axX+NAlOgb46D1fK5fen
	YdQLiNI5uUyLtIMLf6rH3W2wrX++ae0aOI0Egve/G5ccu9rshb6snHDYn9aUzhXBQNSdOdGeZ4+
	hv5fGlbsLc6v5hQomymic4pS5ZdxhVx8ZaA==
X-Gm-Gg: AZFdTZfQRe06w3HZVcKebT3uBKrIZBK/FjgUcHiKCY5JbMaSoowKS98dVa9YHcUQsXO
	x2Yq4Q5AUkvRgeoKj08aI97izNa7tK5+JWjzuVogirZQChqaXq8x3GyQFSQuddm9cB/KUSW9YMh
	9eHXI1L222xvVghARm9ja812vK0oAgiBvmWDwlBMKshk86CjfKeM9wDYQcJaZ3kOyPIS9T1KAgn
	9ipjnKa3tu33mXDdwWi3xUOAvy2wdlJL8pV4yeXaoRHJOwaH5PmEDaBYVHkmpRi4TkM9Tr85epM
	eIwiGrouxTOzDlCiAlcwexKpQSlKXZI+ZOPtCjArn5lOgkBy7GALL3DA4mfq5pzTwc9yrYgEdfe
	Bam8P7KwISKanVZcZWPTnAN952TuEqmv8ZLU=
X-Received: by 2002:a05:690e:169f:b0:67d:bff8:c40b with SMTP id
 956f58d0204a3-67df4486165mr8580139d50.64.1795778061081; Fri, 27 Nov 2026
 03:14:21 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 06:14:20 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 05:29:18 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?2bQ=?= <urak76028@gmail.com>
Date: Fri, 27 Nov 2026 06:14:20 -0500
X-Gm-Features: Aa3M54rN7AW5mPRPQwUBxwnnEZF7QcF45Z8gBuMGIammQ2vqmA9SmILVDb2nDho
Message-ID: <CADwP7EPw617EC4um7m7A3k+gv0MhJBVNQr7eZcsviGod=3cANw@mail.gmail.com>
Subject: MT7626 / Leopard: public Linux platform and Ethernet references
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_031423_805635_E30D3D91 
X-CRM114-Status: UNSURE (   4.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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

Hello MediaTek Linux maintainers,

I am investigating TP-Link EC225-G5(RU) V1.0. Three firmware
references contain a component labelled U-Boot 2014.04-rc1 for
leopard_e and MT7626 markers; the actual silicon identity is
unconfirmed. A local Linux 6.12 experimental build boots in generic
ARM QEMU, and a PDMA variant compiles. Neither establishes target
boot, physical Ethernet, DMA, IRQ or clock operation.

The public MediaTek Linux network-chip support matrix
(https://mtk.docs.kernel.org/matrix/network_chips.html) does not list
MT7626 among the displayed network chips; this is not proof that no
historical source exists; I do not assume register compatibility with
MT7622/MT7629 or other SoCs. Are there publicly available historical
platform trees, bindings or development discussions relevant to
Leopard, especially Ethernet PDMA, MDIO, clock and interrupt
interfaces?

The reference file index also lists WIFI_RAM_CODE_7626.bin; the
filename is not evidence that an existing Linux wireless driver
supports it. Pointers to relevant public source or firmware provenance
documentation would be helpful. This is not a driver submission, a
hardware support claim or a request for proprietary code.

Thank you.

