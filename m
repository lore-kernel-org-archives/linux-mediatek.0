Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40CAC04FFE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xEsgtjhIb67o8dmnbn0ijNuUBqVJ1mlV7N11u3Yqj0=; b=cZWYcD59bhNHj0krbIJZ54QhZF
	GFNypfl18zTt0tL+EDxNkBMnactdoc23oO6mc+1Xf4/vTUpuhmTXlaODuA8FLm/NV+5FXObaa3vH0
	FizvtTgTztMCxNy2kImyg2WIYsjAaPowSt9d6u66pyeIE2E86nBpAHVx//LgvnqstqPPf1v2PUrzC
	/FGSLO3MXj/zX3LHEcE3iuf4FH7mXaFXmtOPmG8DaKbqNMwcmvOJcngiJAfTZOhweNg9suHuYvx1O
	Q81Dm89uPVS7dNWsCFGayNjFfi8DWlH8lRlUxrq5LF/KGdvAVHxy5krf0mSDNOFL5PFvlulsDj2qB
	vlR1l67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4iQg-0000000FrsN-3yVs;
	Wed, 08 May 2024 14:37:58 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4iQb-0000000Frqg-1lkd
	for linux-mediatek@lists.infradead.org;
	Wed, 08 May 2024 14:37:56 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2e3e18c23f9so35103341fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 May 2024 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715179070; x=1715783870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xEsgtjhIb67o8dmnbn0ijNuUBqVJ1mlV7N11u3Yqj0=;
        b=eJ7u2TpjdTPeilI2XmzvoPIY8+XIUmgAojbcOH15O3i1nHL3GXwdl5hybdJ6r6o3Es
         6BMmHAh7tjHanCJSfFOw8ebIagEpLR4nS3KvYuQAM0s8+c0Sq1g4K0uZR/sdlbNvPmG5
         WFpC0ZnZZXChZCPmiRfKgT0aAjCYjOt8zs8SQuyhEg3JqXsD6aZAe6IaKAYESNJLv4t+
         C1ZauLSziMiJhswsw66giLxb1RJzYIpbNifbs7W1bVr7ZflaNsvHJJdZN9ovONxKdVNH
         EWU09oUIWlIYxuRuE5iSytkKCeNChRaMIvB0JvjPkDKS7gHb5KS903GeD/vwsodXSGPb
         C73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715179070; x=1715783870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xEsgtjhIb67o8dmnbn0ijNuUBqVJ1mlV7N11u3Yqj0=;
        b=TT92MxHxUFtBiSpqt87yEeS9v6k4tlu/lMQzA/6mqWFFto41736D3uI/hNlKFKHtUV
         FwfrthB4MmHE7wRA5HpHsCfYlRrd0p+19bRP4jINv6gGYwtBipxQOMalWNsnwV2BLSXP
         pUXf6/8uoCESyT1eg1q/WxOkLLnwA0IBbzVI7BhzjO4fUHrZq7gq742oaSQ/DxwoZIiC
         zjVN+PgWm9yE2jmNv8uc5hFPeED5i+dswLI4qXCIIB1wLkpjKn5q9w6YOac9aFN3iBKY
         T5ac83WMG+0nxAXa2OA3SQmVtqspHaj42UaZXshU1jywdzRMIXpRpwZI9JsdxDeASMih
         cUQA==
X-Forwarded-Encrypted: i=1; AJvYcCU3exXpUxCpsTjWcuitkMBDpZ+/eYFS9e1XxrzpjsWoSrCBj5kwJZ3+1vxmcyhZhZ2yyu+zaoKRwt4tX/bhDBrXOfHX7rxN16PCtJC4IbcmBPl5
X-Gm-Message-State: AOJu0YwJS4NG8WF6c6cjoYWtfzH2DoRR2i3ToKyLkJf2qphCafOsBV7l
	VBsgZkPcpzvWxnFUvtaeGHTVBgCKpOfdKBsfBfehQ29b3mKs6b5rnjFM5jqf2u7U0Vmk7A7tyLu
	OmsJX55WzcslinAd1KmE0se87kns=
X-Google-Smtp-Source: AGHT+IEtd4mai1/RSnx1sodt2ztNxupN11yzK5OtIGIUAo2B68m7Slrvnzjv8SPPecfS9DsZKTC378UPvuO26tKadCs=
X-Received: by 2002:a2e:2286:0:b0:2e1:691b:da0b with SMTP id
 38308e7fff4ca-2e446f772cemr17059791fa.12.1715179070238; Wed, 08 May 2024
 07:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <965cd14922aea67e2750ff2c2ecad773f8ba485a.1715109394.git.sean.wang@kernel.org>
 <202405081456.v2MvcQ0P-lkp@intel.com>
In-Reply-To: <202405081456.v2MvcQ0P-lkp@intel.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 8 May 2024 10:37:37 -0400
Message-ID: <CABBYNZLH7mGdP7AcdHnY8q=3i=Lupk-D2Af4G5X4o1_XdbTfVw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] Bluetooth: btmtk: add the function to get the fw name
To: kernel test robot <lkp@intel.com>
Cc: sean.wang@kernel.org, marcel@holtmann.org, johan.hedberg@gmail.com, 
	oe-kbuild-all@lists.linux.dev, linux-bluetooth@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_073753_517360_C13D8476 
X-CRM114-Status: GOOD (  15.49  )
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

Hi Sean,

On Wed, May 8, 2024 at 3:13=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bluetooth/master]
> [also build test WARNING on bluetooth-next/master linus/master v6.9-rc7 n=
ext-20240507]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/sean-wang-kernel-o=
rg/Bluetooth-btmtk-apply-the-common-btmtk_fw_get_filename/20240508-032333
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetoo=
th.git master
> patch link:    https://lore.kernel.org/r/965cd14922aea67e2750ff2c2ecad773=
f8ba485a.1715109394.git.sean.wang%40kernel.org
> patch subject: [PATCH v4 1/5] Bluetooth: btmtk: add the function to get t=
he fw name
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240508=
/202405081456.v2MvcQ0P-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240508/202405081456.v2MvcQ0P-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405081456.v2MvcQ0P-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/bluetooth/btmtk.c: In function 'btmtk_fw_get_filename':
> >> drivers/bluetooth/btmtk.c:115:35: warning: 'mediatek/BT_RAM_CODE_MT' d=
irective output truncated writing 23 bytes into a region of size 8 [-Wforma=
t-truncation=3D]
>      115 |                          "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hd=
r.bin",
>          |                           ~~~~~~~~^~~~~~~~~~~~~~~
>    drivers/bluetooth/btmtk.c:115:26: note: directive argument in the rang=
e [1, 256]
>      115 |                          "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hd=
r.bin",
>          |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    drivers/bluetooth/btmtk.c:114:17: note: 'snprintf' output between 41 a=
nd 43 bytes into a destination of size 8
>      114 |                 snprintf(buf, sizeof(size),
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>      115 |                          "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hd=
r.bin",
>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
>      116 |                          dev_id & 0xffff, (fw_ver & 0xff) + 1)=
;
>          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +115 drivers/bluetooth/btmtk.c
>
>    105
>    106  void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u3=
2 fw_ver,
>    107                             u32 fw_flavor)
>    108  {
>    109          if (dev_id =3D=3D 0x7925)
>    110                  snprintf(buf, size,
>    111                           "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x=
_hdr.bin",
>    112                           dev_id & 0xffff, dev_id & 0xffff, (fw_ve=
r & 0xff) + 1);
>    113          else if (dev_id =3D=3D 0x7961 && fw_flavor)
>    114                  snprintf(buf, sizeof(size),
>  > 115                           "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr.b=
in",
>    116                           dev_id & 0xffff, (fw_ver & 0xff) + 1);
>    117          else
>    118                  snprintf(buf, size,
>    119                           "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bi=
n",
>    120                           dev_id & 0xffff, (fw_ver & 0xff) + 1);
>    121  }
>    122  EXPORT_SYMBOL_GPL(btmtk_fw_get_filename);
>    123

Could you please fix the above?

--=20
Luiz Augusto von Dentz

