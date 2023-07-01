Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2196EB64DA
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jul 2023 00:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frNBpN5Ah3HHFVhq8vAbyVzkXEJ+bYa1e3oBl0nbpV8=; b=c5GWPGHNYXlWkSLw/g9mbMG8GN
	FcjHc0BURH9v+XeLLBy9w+aPfmYvV7tDKWjNLVb3yb9QMhakc80k+sGyGhQO0OueaEwbYC8g/xMxs
	ghk2GqaWGimxcZgRXXPRKkRVdGiIwlz5qRDjAJLjQ+hAT4yZCMXZzr5/W5NL2taJry83dM5UylCeY
	/hkoKrZvk2/eVWkJtDY2qxAPz+b/Bx5q0RrpPX+chbVYKxoouWCJzsevi4P8XOhiVTpZ9DDiGBLgn
	AJUDDANbzUkN25EZPeXIEhC7MDP2BTwhrVgfJcFTngy+Ev9KcLUVl6ZzkU3zKiAlTpz8PvQCzdvf2
	PYfXZJ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFOBK-004oqx-34;
	Sat, 01 Jul 2023 00:09:42 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qFOBH-004oqX-18;
	Sat, 01 Jul 2023 00:09:39 +0000
Message-ID: <2e729756-4468-9e3a-2664-9b1b4b4ca060@infradead.org>
Date: Fri, 30 Jun 2023 17:09:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: linux-next: Tree for Jun 30 (drivers/bluetooth/btmtk.c)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Jing Cai <jing.cai@mediatek.com>, Chris Lu <chris.lu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>
References: <20230630131756.6dee658e@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230630131756.6dee658e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 6/29/23 20:17, Stephen Rothwell wrote:
> Hi all,
> 
> Please do *not* add any v6.6 related stuff to your linux-next included
> branches until after v6.5-rc1 has been released.
> 
> This release is broken for 32 bit sparc builds.
> 
> Changes since 20230629:
> 

When CONFIG_DEV_COREDUMP is not set,
gcc 12.2.0 (crosstools from kernel.org) complains:

../drivers/bluetooth/btmtk.c: In function 'btmtk_process_coredump':
../drivers/bluetooth/btmtk.c:386:44: error: 'struct hci_dev' has no member named 'dump'
  386 |                 schedule_delayed_work(&hdev->dump.dump_timeout,
      |                  

I see this on arm64, ppc64, riscv32, i386, x86_64


PS: please add a MAINTAINERS entry for btmtk.c.

-- 
~Randy

