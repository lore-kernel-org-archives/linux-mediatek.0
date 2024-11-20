Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275B6D711AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2024 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OQ8ua/bjCK0E3hD1JI4CPmg/McCM0qMSIeRiCmq2TwQ=; b=THR0cgLHNO08JGLHsm4zJf9Lo6
	r9xk8nhmMr9Px4mxgYMavJnd9ssuOkuQg690SQLTUl7gvYkwWp7wXaybYkH3OVyLSfYspWjkRztOE
	+u5t3fonxClZmxSZK1hCn77GyY4lj6cGdjZKbK7nmrRZNsdBbXHLWkwgqLGBEUh6/LnSiXvVXnsbU
	8YmELtYkmsZfzHBpXRlHhzLMEHMYjic3q0hjamTYYjNFd7orb9C7wYtxhRQIB3i2sA66QiAN35rNx
	XbBltTS2oQj6gW4ST/J4PX635qIAm2wNUGy7oCx/CkSvHSBlZfYxM8h6ASgUEnI8TQSLZRlN6hNLi
	UeRk0roQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmNi-0000000Fegs-2pc4;
	Wed, 20 Nov 2024 15:12:38 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmNf-0000000FefR-2Jcv
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Nov 2024 15:12:37 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id E8BB8138026E;
	Wed, 20 Nov 2024 10:12:31 -0500 (EST)
Received: from phl-imap-13 ([10.202.2.103])
  by phl-compute-07.internal (MEProxy); Wed, 20 Nov 2024 10:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1732115551; x=1732201951; bh=OQ
	8ua/bjCK0E3hD1JI4CPmg/McCM0qMSIeRiCmq2TwQ=; b=WgCR4ZeI0loXpOWfAY
	P/5YXuNBY5Yy2x9rZGEv0yYxr4zt5SEBdwzbEn9RIcWn6X0y++WxrhLoprvkUlK/
	zlVyRHo3V8+JLUGiP2YngdlqszHZ59YsBrb2sjtFn9WkSW5OMRElx9KA06Ku5SFw
	bA9TKOVb3MU8EYmVf9eqAXzEr5olc0npdzdH/ObSUWVE+BBaA9oOy6sRhhffayVX
	K1x29Ldnxgp0LKCpUpJ71WiPyb3DAWKR4Cct4QXS498lVC6Oh8UoTJmfUn3Ow+rn
	BJyRCXfUIQRVyRJGABaIhTX6Enr7D2gwqpqUb0v7QD/k9es/qz7EyHFreF1FPY2m
	jVDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1732115551; x=1732201951; bh=OQ8ua/bjCK0E3hD1JI4CPmg/McCM
	0qMSIeRiCmq2TwQ=; b=FP1F6hzlxuETlRVz0/yRQmKgwdAwkwCZ6upMFABQvKzI
	907VjM9hiFM+VHibKM2VYSySuQdL7bjU0DzSS05wIVxvkSODUjIZRTJNdTknOutG
	5AwO9yWDE//EDHyscujqDmmMeZ0eyRF4zmAL9KF3qReftadMM/ZB94EsUJHB3+eE
	C+cbuGm0bEmWtJf4UwCy6m5ZCXr2FxnojxzJs3oBfbV8p9+zTlVhyGLfsoOA3y4g
	wVA0oSr5VdQViBaHEBRCllQQ1HbQ+/fX7vu6ipVFM7vlzC0M84DANqSRItlUvvi2
	7SJP47LtqLYbdO6h5fOZn/7zTHSlWXrFQ9MN4pUZEg==
X-ME-Sender: <xms:X_w9ZzY0Qa5BlKeikt4F34FLyK_ZkEeK2OF1QH_QBw9kVlxPaLu6aw>
    <xme:X_w9ZybbaQTACYDibiJZWC-ur85IIaxlbhzeZ4Xq45q5WVHHVfcRHS1dzxvwWuwIH
    mWLzlnfI5kHB9j_RIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeggdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggfffhvf
    evkffutgfgsehtjeertdertddtnecuhfhrohhmpehstghrvggvnhhsuceoshgtrhgvvghn
    shhssehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepudetueejudevke
    ejkedtgfdtvdegleekjedtgefffefguddvhfeifefgtdeuvedvnecuffhomhgrihhnpehk
    vghrnhgvlhdrohhrghdpfhhrrghmvgdrfihorhhkpdgrrhgthhhlihhnuhigrdhorhhgpd
    hmrghnjhgrrhhordhorhhgpdhlrghunhgthhhprggurdhnvghtnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgtrhgvvghnshhssehfrghsth
    hmrghilhdrtghomhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepshgvrghnrdifrghnghesmhgvughirghtvghkrdgtohhm
X-ME-Proxy: <xmx:X_w9Z1_LXu7Q8nL0VO5_oiH4yg3V6ubkmcd57aaCl4r8XzNnszpqSA>
    <xmx:X_w9Z5pdi8sVSBDe4Di6iNrR84dhLdRURGhiqvQqxsfv92PZWtyMqg>
    <xmx:X_w9Z-r6qvLXYriAYYpmJJPmyOGyJMgB2ye8E8AKAhIDKHdd4zA0BQ>
    <xmx:X_w9Z_St2azB4ULZ6MF3hly-N31uIwsVMiKPo_0AkuxS3CquOe77eQ>
    <xmx:X_w9ZzDCshSH3mPQxzzIP-e7wY-WQld5AwUa0DpewKdOx_B0QAbzvdXS>
Feedback-ID: i755648ba:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 36FB91F00072; Wed, 20 Nov 2024 10:12:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 20 Nov 2024 10:12:10 -0500
From: screens <screenss@fastmail.com>
To: linux-mediatek@lists.infradead.org
Cc: sean.wang@mediatek.com
Message-Id: <cd45ed44-ee2d-40f6-a45a-cec56c2cdd00@app.fastmail.com>
Subject: mt7921e kernel driver issues
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_071235_860968_FCD45498 
X-CRM114-Status: UNSURE (   3.32  )
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

Hello, I'm reaching out in hopes to draw some attention to this Mediatek kernel driver issue: https://bugzilla.kernel.org/show_bug.cgi?id=217415

The issue has been active for months, and there are numerous threads spanning many distributions and laptop forums that describe the issue and the needed workarounds.
* https://community.frame.work/t/framework-13-amd-on-arch-issues-with-wireless-after-resume/44597
* https://community.frame.work/t/responded-arch-hibernation-woes-on-amd-13/45474
* https://bbs.archlinux.org/viewtopic.php?id=295916
* https://forum.manjaro.org/t/mediatek-mt7921e-fails-in-kernel-6-6-and-later-through-6-10/164217
* https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1975444

Are there any plans to fully address this issue?

Thank you.

