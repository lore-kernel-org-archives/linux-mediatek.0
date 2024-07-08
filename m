Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC2BC3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 05:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DALaIj5D0ngUpE3QcDtL9Tx75VDgfDtCcQoihqem+eU=; b=LmcSvP7A2s77Mpqf1KnLuK5mhs
	aHDjVfwrP/4pXiQu/l6K5QHbv9xnCiX8nHjhwhcAHa1ntbBfcbGk3ofi8Yrtb3Pqu/ZyamX029mmb
	XYQeHMSjzQDfZUQYPDCxuGTv/zOe/7fSNNZFcnGRwDcwkugDKi3TG0Jq19FmpUWnogKE+IizTm/mB
	RliXnkxV8atVTyuGbcvbrRP5itKJO32C05oKywWi8MCkQEbWNUtQ7vYvjQWW9IMiDzqZ1QOZq274p
	Z3/33L/pJ1BUA8CX4+8t3k4PCuA9Fm5RsFEXgWjBqYhUaX0106sSfbsdo1qhdaa9C5ng970SNpp0e
	nZc+g1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhAq-00000002nGe-2x8F;
	Mon, 08 Jul 2024 05:44:28 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhAX-00000002nEQ-2uHr;
	Mon, 08 Jul 2024 05:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720417435; x=1721022235; i=markus.elfring@web.de;
	bh=DALaIj5D0ngUpE3QcDtL9Tx75VDgfDtCcQoihqem+eU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DPEKA8RCl31fbApspxGmofEe1CpWf/Y4h/qY77AaJpmutiCrlSQzE5Q8SCliwWMk
	 jT7D48TDqlJtylnjHZCBstAo+D/MJS/UQ+bZqpefwR8PkpU8K/LxQiLd84XIu9Ssr
	 qi4fX+teEcKS6CLwdDP4HQG5ofVMhkw3Do/SwbdZvPbEUHD2chRC4d1RYqo5SnMQN
	 F5Xh9PoPKTkGpyx1YTXTTc1PpZQMZCu2GLaxSVn4vHaiIIKy4R/9rkwp6P35l/e5y
	 jqfUREE2b/TdfCSvhRa2L0RtP+1aibPSM2Bgi2+Pb+XsaOt5zQpXC9fsWkj+a44Pc
	 cfqvf8KG7B9F6q2Wvw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Md6y1-1rqoRs3EI7-00pRod; Mon, 08
 Jul 2024 07:43:55 +0200
Message-ID: <9d07628a-eadd-4e50-b7a8-02adb25981ab@web.de>
Date: Mon, 8 Jul 2024 07:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blk-cgroup: add spin_lock for u64_stats_update
To: =?UTF-8?B?Qm95IFd1ICjlkLPli4Poqrwp?= <Boy.Wu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-block@vger.kernel.org,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Burkov <boris@bur.io>, =?UTF-8?B?SXZlcmxpbiBXYW5nICjnjovoi7PpnJYp?=
 <Iverlin.Wang@mediatek.com>, Jens Axboe <axboe@kernel.dk>,
 Josef Bacik <josef@toxicpanda.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tejun Heo <tj@kernel.org>
References: <20240705075544.11315-1-boy.wu@mediatek.com>
 <8f3765db-842d-4568-9ac5-1bd9cab9e952@web.de>
 <554f09bc6fc8f3b2a71b346f5e363950a1f8cb18.camel@mediatek.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <554f09bc6fc8f3b2a71b346f5e363950a1f8cb18.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3sJU37sIvlaJq7Km1wDF5IIF4lzBgJzAmJNGao7ZbnmtFMNOGEX
 a0M9mcYkZu6NHcupZ5lRmhoRGXAvsPZtDR5HnRyla7hrTOgSetDPKpk5MMaUq9uq37xcIBU
 JTyw2tNXilctDrEL9RL5hkyqtv4YdR9V8Q2kRV9KYqGzVjcXA0zrjukgdO1SXx5zScIBBvb
 x3REhI7jDbxSPP+oZ7Tpw==
UI-OutboundReport: notjunk:1;M01:P0:THrU1lGh5FU=;odnaXHAtD4xNlL0C54CvnW5dGsU
 vi0bGEuPK7OVwPaqNt5nY/qch3F0LELkYsaF1ZUmv4PFt4fX5XmFiOw9o6a9XpPOguq2QOOG+
 kVbVbnRx90tteILmOYk2VRJ9O4wW0Kt65knqOOSJEt83KoueTrMqc2WNGy6qzH2ZeGR8s1aaW
 FaDFs5cqbgz3upkkJMZRxItKUp4Q3t+UFPEasd82wM+Gkt5E/IfLcEi8oeSXg36PlCDc233n9
 piLw9rhylMR/vWzfNmmEeN6ukRVq+Wg5zAUg2tK7daB89EXhfThnFRdtov5eKrqOP13lGpXJ5
 1t3EoDH4H3N+NKNLt7EhbMXDuP6G8HOdsgRS6N9rIwNx/jryZzTK5SZP4ObWXLUI/vxiMlRAP
 5O8LFZEThu97Jh2Xx0+ooSsOsIGdPOqmYtT0P0/TEIDwmjWX6NqrmzQxCmt6edTa0pwp62Kpm
 vhpPxQlcCn2S2gRbWDZby6oj0Zb4sHy1CaP0HbgWU5CEJWs9VrJbxiTi3apBl27iO3ntiT16L
 y+4WjAidinrjGY6Ub4fBmwfGgI52pjLsU7VIm9ZQqiOIWlLiwlD9iAhNLj3lDRuVAHiIjVOiy
 CVCalkeyyr0d1N/Ya7SHfxvsE1gaHbmtte1tHo5i/ZlbRZfmwRjF+ZTeXR5LYh9KOoNwkW7Sv
 +h5NxqoqTKOrBGCkKDW2d30m9V2gGUCPlt3iOIc1LOuJwqiEKP1xZ4OKvWXnB7GYWS/Gx4tkc
 +3Lx1l7Q+1/1SElJv36H2dK8PUifBGWySckTJPv7meWdq72Yk+3FbPZKDwQXE3rUekzhDEpe2
 ErGe3j+PwwEj+ggUGfPbebp2fiueh/HwaoZ90i/cdG24g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_224410_203959_ABB3B720 
X-CRM114-Status: UNSURE (   3.89  )
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

> ************* MEDIATEK Confidentiality Notice ********************
=E2=80=A6

Please omit such information from your patches for Linux software componen=
ts.
Such hints do probably not fit to communication characteristics of Linux m=
ailing lists.

Regards,
Markus

