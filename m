Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CA3C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQPi1Wj70Oupw3S1Uh8a0kVTS9NCfvHSV4FIWEU0DCI=; b=bsShUWSv9ZE97UQpclOru+9ktc
	LnrXLL/DB1A8oitJCE0ICqIp68SWoKxg+/8FPQ/Yowple/+4EJvHt969r17WkJ2h6Phcz4/c78BB/
	p9j3uRz1C70gJu6RberEJObWtnN5ekmeUKzl32ggMW5WPhwkMci8bsR3nWAOpbWm1mPEPr+s7KL+p
	/d0FcEQJ+7f8vxjTyiepbpx85IOMqq4WAEv3E8rfPN4KCfjqk8biQizUYNvY6ziW1hIV38wkqvbPj
	43JdAXVt7ArAf3erLpgIWmhgb7wvLmue0oS7JXLvbEYlRMowxr/yXAIZbE4WIs4o+Ur63PSps1Hyu
	5STnTb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv2M-000000076Jb-2Okl;
	Wed, 05 Jun 2024 18:07:02 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv2J-000000076H8-1uLV
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Jun 2024 18:07:01 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so2202181fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Jun 2024 11:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717610814; x=1718215614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQPi1Wj70Oupw3S1Uh8a0kVTS9NCfvHSV4FIWEU0DCI=;
        b=Bjfn1wcjSVqgVIQxhnGNs8VPJlkM3ZOHtADHRYWqUyeKvVz4UvpDfBnTZXw9aXimg8
         Ppz36qDhELd4+X9sMjYSqN+HRrXIZhzEzTuBIuPWlKT30qbGLUp7UMCe7Q/iOjHpxS0u
         2ICvBZwlARQKC6UJ0yl/72nuJ1soIuBTryjOhPs/hCQLq+RwGzmAshWU34alPmS9FdUi
         jy+vCXnwqI4Mav8W1deIU0U37J1OCCP1x+CpLyR93Vay7ZQLS63893lnp4paZuZMxyfU
         pK4w51BA7oyacvNnGrOYLyF+yVptTb0wwaMozYfqCkj1Jpf2o5b18pMSVajtblc22X6k
         6DQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610814; x=1718215614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQPi1Wj70Oupw3S1Uh8a0kVTS9NCfvHSV4FIWEU0DCI=;
        b=TAq4tsCpyxbfVsCQ1g9LGDtFGNBtP4er0zTen3X5kyQjlgopeYTcB/Y99/jJWDhVFL
         TdCnVOZrtafoGRLcc05wfuMeoy7vYTVeq1T4HP/gbrnDHhuM1KyBxzY8UtZOy8rPjrmV
         1/OT+WH2QuWY1c3BPdEGeEoXPL2vofwB4MDiwgTcMeWG3QrK4Rl8o1tzwmYhMgBtPP12
         WOjcDixyZPbnJL4E293+iCxu4Y6l0o7BOyCgcrZonzuci7UHrOzQ1u3veutyh4wkrKkn
         KaCrvRXcM4YsF7oDSoNInZfdBpY5fYgUKkn7rpY1LcG4G483oBgw6usvqNDHhXTd9ohA
         VPCg==
X-Forwarded-Encrypted: i=1; AJvYcCWeaBQyiSk7bFVNEYAh4ozB07ROxejL9X/10SMt7X2Ji/jwY82/nPX4ZA953JigssLdPGgDdZCAepu5Nv0LfPH4WsVW/tNn8N8STGcnqacB+ptS
X-Gm-Message-State: AOJu0YwOB6V1Su+IP8AF5kM8kC/pROujsVJrZe0aWEBgwL7Saii0B0FQ
	aiBIh8Lyqd4BU+14kxgxX6dDBeC556jTToB5ZiQ9NL3D//2VjkSPzLk7tO8MzYUhVoDSlpfzn6i
	muxkvncJIVa2cJ8Itz03l3D96l+I=
X-Google-Smtp-Source: AGHT+IFWST8ze+N1VpaqPM/3uL4sma2IzWxZluNfA2aUcgK/aGhvbZkVOWJpbYGfeGvQzByQV8DY+V2TKm/l0+o9t+M=
X-Received: by 2002:a2e:a78f:0:b0:2de:8697:e08b with SMTP id
 38308e7fff4ca-2eac79c888dmr29788511fa.26.1717610814048; Wed, 05 Jun 2024
 11:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240529062946.5655-4-chris.lu@mediatek.com> <202405300602.AUh9Yu96-lkp@intel.com>
In-Reply-To: <202405300602.AUh9Yu96-lkp@intel.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 5 Jun 2024 14:06:41 -0400
Message-ID: <CABBYNZK53Fx8rmanh6fsLsNjppEtThtis8naKa11nLk3gCHbLQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Bluetooth: btusb: mediatek: add MediaTek ISO data
 transmission function
To: kernel test robot <lkp@intel.com>
Cc: Chris Lu <chris.lu@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Sean Wang <sean.wang@mediatek.com>, 
	Deren Wu <deren.Wu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, 
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_110659_514605_B2747783 
X-CRM114-Status: GOOD (  14.44  )
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

Hi Chris,

On Wed, May 29, 2024 at 7:10=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Chris,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bluetooth-next/master]
> [also build test ERROR on next-20240529]
> [cannot apply to bluetooth/master linus/master v6.10-rc1]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Lu/Bluetooth=
-net-add-hci_iso_hdr-function-for-iso-data/20240529-143216
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetoo=
th-next.git master
> patch link:    https://lore.kernel.org/r/20240529062946.5655-4-chris.lu%4=
0mediatek.com
> patch subject: [PATCH v2 3/3] Bluetooth: btusb: mediatek: add MediaTek IS=
O data transmission function
> config: i386-randconfig-014-20240530 (https://download.01.org/0day-ci/arc=
hive/20240530/202405300602.AUh9Yu96-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a=
15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240530/202405300602.AUh9Yu96-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405300602.AUh9Yu96-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: btmtk_isopkt_pad
>    >>> referenced by btusb.c:2267 (drivers/bluetooth/btusb.c:2267)
>    >>>               drivers/bluetooth/btusb.o:(btusb_send_frame) in arch=
ive vmlinux.a

Please have the above fixed and while at move the vendor specific
handling of the new endpoint to btmtk.c since that is not standard it
shall not be part of btusb.c


--=20
Luiz Augusto von Dentz

