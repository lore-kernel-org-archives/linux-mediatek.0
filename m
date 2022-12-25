Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B2CC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Dec 2022 16:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=shsigjtb9dRU+8AvOmwCeo99R9QRCTxMNMi5Xyf1dGI=; b=KnIjz8ElOyzOdfF8LQCLfOjfJI
	+HRInFhbX5uLMY4y70gBzEPmvNVlqLBzMMHyo4tnrboI0Fe0xUHd+qCuaBdU2mrljtZULudSqWekv
	BJwqL6UstCJ6bQZ8qDPGJawZf1mgMhQqZtXIcM2a10YBizcEEBe44YdU3ALt+rbLwjnIOY/+BUQYX
	m8lyDg8agANBiNX/p3iffn+00Or19ddFsXO09fN9pehOjqwX0lpyTQ5gBUpwhOFtDK2y2tW71C0I8
	Zw1hkwFALbxreamRO5F6UaYuL7PXKNT5d8ccs02XyQk/8O2EVpo6cRswdq1/4ytqXp/qU7AaLgSxA
	AUisZhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9UIO-00DLmW-17; Sun, 25 Dec 2022 16:56:21 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9SJb-00C9gZ-ND
	for linux-mediatek@lists.infradead.org; Sun, 25 Dec 2022 14:49:29 +0000
Received: by mail-ed1-x52b.google.com with SMTP id s5so13020580edc.12
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Dec 2022 06:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=shsigjtb9dRU+8AvOmwCeo99R9QRCTxMNMi5Xyf1dGI=;
        b=BQIfP9O8QJPdtjScs25CDP1bsKG2Z4vTt4xlGJd59JwbtiYZTQmROrF0kbm2pJYRyx
         nNDFFjGJzgZ2NaMYo2sNobjdLVPujWNLPDiKgtGOOFoKuVVY7E9RvtRy2QR4j0mNbXxg
         j/vgAfJB7YM4WLS01pUfd/gfQkEN+2jNLqRg8EdAuJqa4zIIy04fyqrwMLEYYSSdUqg8
         TZrEfbK8vTwcAcHB5TvqOLP/fiG41q6+eXfB1xU/lmos+Sb632WYYiisoeHsAQoAmD/+
         s2ApjIFi1+gTwWEZ+ttsPLojWmafVfWo+nLEApssvl1V925Y9TXaLR4UutKLoJZW46K3
         LgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shsigjtb9dRU+8AvOmwCeo99R9QRCTxMNMi5Xyf1dGI=;
        b=GAs7r44UOv5Sci/hVuCjb9AKLoqyOP5h5gaYhIWthpVpnmq/VFb3cQ7BWOhfGrys3f
         HdXsJVlXw6lf4xOI0X4vhPU2AsJruawVWzbRo+Ibybd4D7PoXHBT/CpQDlpnxGqmeoEI
         p55W+SUgUGJwZzlXqp83x/ukmlIyky7v9MbiIahqUePiq+ChfBbERccKQpqF/hkWyHml
         5HqArPtZjkBa1NZFdi6Nr9ZXM16ickBCmteAEcpuLV6lWEnjGVDJ6xp1NA29OqAZ/ZfX
         oWAOINdzasdcfvHQsI5Tv+WcBTLv7YuF8tD4fIC043EhE4fTVe7k26xj0GkKdmZZ2aY0
         o46A==
X-Gm-Message-State: AFqh2kqMUtuckOMH2CvfpEv02p13XstReeZRcCqecQBjkxXokX7RKhk/
	rXttkDaq5Odl/apyxdkWrSCa3akBXaHiryVHn2rAAuwmyHVA
X-Google-Smtp-Source: AMrXdXsb/gHe4oKI3J1ldSRJjySGB7VgG5uMJQX4VUPNnEGRqyR1RmK4RExuya4uvRZpDmALz9HJ6CXIuqXbK4wtQOg=
X-Received: by 2002:aa7:c6c7:0:b0:46d:8e85:170e with SMTP id
 b7-20020aa7c6c7000000b0046d8e85170emr1780952eds.422.1671979765308; Sun, 25
 Dec 2022 06:49:25 -0800 (PST)
MIME-Version: 1.0
From: Vishal Rao <vishalrao@gmail.com>
Date: Sun, 25 Dec 2022 20:19:15 +0530
Message-ID: <CAMWtyy1sSHc_DYQ3kq+FWMJKK5Wo3QEgO1yd6wQXx3x0Lp4Uog@mail.gmail.com>
Subject: Wifi 6E 6ghz not working on MediaTek MT7922 (AMD RZ616)
To: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_064927_813226_5A497C0E 
X-CRM114-Status: UNSURE (   4.14  )
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

Hello!

Using Ubuntu 22.04 LTS based distro elementary OS 7 with the latest
available Ubuntu mainline kernel 6.1 RC5 build the wifi does not
connect to the 6GHZ band (Wifi 6E) and it only even shows the 6ghz
SSID name *after* I have connected to the 5ghz wifi band.

This is on a new ASUS ZenBook laptop model UM5302TA with the AMD Ryzen
6800U CPU platform which includes the AMD-Mediatek co-developed RZ616
wifi chip I believe.

Pastebin of lspci -vvnn output: https://pastebin.ubuntu.com/p/QwM58ZkptG

Let me know what further information I should provide - happy to do so!

Regards,
Vishal Rao

