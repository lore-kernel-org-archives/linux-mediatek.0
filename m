Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594E0C04FFE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 20:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hyMQc364GzRHiQvLV8v/9Hi/7DoGsWnhRdSDKuyil0=; b=BBLNKjtQe2/3oOJ7VHZ+XtjP8s
	OEbR2buJVzz1OG2kTUTk+g/XAa5C4gxXqv8pYNaaqe1uYg+POpzMcFaMCZNZ6L0boC7HQsGYYCLQZ
	tYLyQLcH0n73WHQg34ITCS007DS9NO62UrZLy5b89pVTtJD5IHdu8mcdSnvBEmEOaZy87NzVv63I/
	bo6hC0iYT1kYO35WwnzuAJTNWwIU2noJJle6YZcVSr07sfioU6deQ3FZHlqxyVzy1ko8GpmKm03gh
	bbPVsrLj8Lj1wNiBLB8JY5LeAhf0uZ8N+fYLUGnf32fmygeB5v7JrOpd+Qtft1UCSWJxlvucsS7wT
	ehnQyoAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4o3e-0000000Gulw-0HOu;
	Wed, 08 May 2024 20:38:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4o3a-0000000Gul3-1zJ2
	for linux-mediatek@lists.infradead.org;
	Wed, 08 May 2024 20:38:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2A981CE19F7
	for <linux-mediatek@lists.infradead.org>; Wed,  8 May 2024 20:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6939AC32786
	for <linux-mediatek@lists.infradead.org>; Wed,  8 May 2024 20:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715200707;
	bh=iELKPKEBdzp99N3dT3F0Gig++k6H1GB9X40m4RmGOXA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kBNAqTg4HplcgEYFfj01exaT7HAJ7N+FPWaC/TIuRtChjY8DK2FRDaX93GhxSEBw7
	 FAqPYf0Z18yxPQAcd9/CTsXCX3Iu9+hhdjy2Bw+6EehEFvSs0k/YeYRowDbHru8Stb
	 MdErkMNhjlkl+hEmuA9AgEQ8V0nS8H+G5C+FWaD/c1iH9sBWOReEbWP4GrqW7VmnZ5
	 DNuz5abzNzoJPXy3uXPuJNUpC4KgjvtX4pUNY+0OaQIMsU3ww6uMWEsn9Hn2OibqCt
	 JFqASvEe7AAt9FyFBGujWXAB5TJF2A/wWAlcHSz/kj3VrEB+8Xnh+7pbYPcfdlq6w+
	 +X3hN60qFmhfA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59a0906a7aso4850966b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 May 2024 13:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPnrd7LiKRguZwnjaPRadAwQqxSOiwToBvEtbouETdAPOohHdO8LmlGAOnajljLxlfF+MAtkj3yQI2ox2EQNqFJxLkOT1qRYhugaOmzuuxpzIF
X-Gm-Message-State: AOJu0Yx6YX/a50JzHrv5coe1gsfAuxm+tu2EZh2qZWwm7IGF/ZK+PWED
	AVrIs20xAvX8UMNPCcGmbAYQOc1q3HzCGh31PpDQ29yUELODuCmB+A8IZ2o8pb60ijPPGpBHqoz
	Ksfb4WSS2Pr9fVds6VHfwhKRXojY=
X-Google-Smtp-Source: AGHT+IGl3o8/eHyjVt0T4UwXGfTaWvH2xFalvsf84UytUpmXoRi9teX9R7b2iY+GS6HtUaWKgNUfBGoI1uT+V5ZO1m8=
X-Received: by 2002:a17:906:df14:b0:a59:bce9:8454 with SMTP id
 a640c23a62f3a-a59fb94f6d3mr232661766b.1.1715200705917; Wed, 08 May 2024
 13:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
 <202405081456.v2MvcQ0P-lkp@intel.com> <CABBYNZLH7mGdP7AcdHnY8q=3i=Lupk-D2Af4G5X4o1_XdbTfVw@mail.gmail.com>
In-Reply-To: <CABBYNZLH7mGdP7AcdHnY8q=3i=Lupk-D2Af4G5X4o1_XdbTfVw@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 8 May 2024 13:38:13 -0700
X-Gmail-Original-Message-ID: <CAGp9LzrNE9Hi-a9y8oQMXmug44k7VUsmcDiAiXgbFu8bLbtFTg@mail.gmail.com>
Message-ID: <CAGp9LzrNE9Hi-a9y8oQMXmug44k7VUsmcDiAiXgbFu8bLbtFTg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] Bluetooth: btmtk: add the function to get the fw name
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: kernel test robot <lkp@intel.com>, marcel@holtmann.org, johan.hedberg@gmail.com, 
	oe-kbuild-all@lists.linux.dev, linux-bluetooth@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_133830_966847_C8824A2E 
X-CRM114-Status: GOOD (  21.42  )
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

On Wed, May 8, 2024 at 7:37=E2=80=AFAM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Sean,
>
> On Wed, May 8, 2024 at 3:13=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
> >
> > Hi,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on bluetooth/master]
> > [also build test WARNING on bluetooth-next/master linus/master v6.9-rc7=
 next-20240507]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/sean-wang-kernel=
-org/Bluetooth-btmtk-apply-the-common-btmtk_fw_get_filename/20240508-032333
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluet=
ooth.git master
> > patch link:    https://lore.kernel.org/r/965cd14922aea67e2750ff2c2ecad7=
73f8ba485a.1715109394.git.sean.wang%40kernel.org
> > patch subject: [PATCH v4 1/5] Bluetooth: btmtk: add the function to get=
 the fw name
> > config: arm64-defconfig (https://download.01.org/0day-ci/archive/202405=
08/202405081456.v2MvcQ0P-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240508/202405081456.v2MvcQ0P-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202405081456.v2MvcQ0P-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/bluetooth/btmtk.c: In function 'btmtk_fw_get_filename':
> > >> drivers/bluetooth/btmtk.c:115:35: warning: 'mediatek/BT_RAM_CODE_MT'=
 directive output truncated writing 23 bytes into a region of size 8 [-Wfor=
mat-truncation=3D]
> >      115 |                          "mediatek/BT_RAM_CODE_MT%04x_1a_%x_=
hdr.bin",
> >          |                           ~~~~~~~~^~~~~~~~~~~~~~~
> >    drivers/bluetooth/btmtk.c:115:26: note: directive argument in the ra=
nge [1, 256]
> >      115 |                          "mediatek/BT_RAM_CODE_MT%04x_1a_%x_=
hdr.bin",
> >          |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
> >    drivers/bluetooth/btmtk.c:114:17: note: 'snprintf' output between 41=
 and 43 bytes into a destination of size 8
> >      114 |                 snprintf(buf, sizeof(size),
> >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >      115 |                          "mediatek/BT_RAM_CODE_MT%04x_1a_%x_=
hdr.bin",
> >          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
> >      116 |                          dev_id & 0xffff, (fw_ver & 0xff) + =
1);
> >          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
> >
> >
> > vim +115 drivers/bluetooth/btmtk.c
> >
> >    105
> >    106  void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, =
u32 fw_ver,
> >    107                             u32 fw_flavor)
> >    108  {
> >    109          if (dev_id =3D=3D 0x7925)
> >    110                  snprintf(buf, size,
> >    111                           "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_=
%x_hdr.bin",
> >    112                           dev_id & 0xffff, dev_id & 0xffff, (fw_=
ver & 0xff) + 1);
> >    113          else if (dev_id =3D=3D 0x7961 && fw_flavor)
> >    114                  snprintf(buf, sizeof(size),
> >  > 115                           "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr=
.bin",
> >    116                           dev_id & 0xffff, (fw_ver & 0xff) + 1);
> >    117          else
> >    118                  snprintf(buf, size,
> >    119                           "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.=
bin",
> >    120                           dev_id & 0xffff, (fw_ver & 0xff) + 1);
> >    121  }
> >    122  EXPORT_SYMBOL_GPL(btmtk_fw_get_filename);
> >    123
>
> Could you please fix the above?

No problem, I'll take care of it and send it over later.

                 Sean
>
> --
> Luiz Augusto von Dentz

