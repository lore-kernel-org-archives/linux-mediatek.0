Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379F0EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6ojjoj528580DYzIEP6XgoOL7aePsN/TYuceJeg3YE=; b=TXF21O1gU5e3p4S2exHqS2RIUs
	WYEgq2xVc/zMkakSwXNFcAD640LgpdfuSAoURzIFDs/RTXOmq/f67ILKneXIaxwk7BpBia7l2pfRr
	+o4o5Uo+kPGkYsLRmgaH1Ym6dMJfgpA5StC0pF/k2/3szsexGQy318acUso4uexffg7EGCZK3vpyL
	DBJjLJkwxCf0EQlzBwlFAoclT/LOODY2NncW6VjsGrgNboGr9l6+the/D6Dn/bLW/5/4sQ2tvqthp
	LBL/3GBT2S28jP5odkID9RKXEDDTMyqZiodbJbN6T81Kw8eCx2OhrKMdMn95havBH/o7WXXDFnP8e
	LKKfwsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfcee-00HZNd-2m;
	Mon, 11 Sep 2023 08:52:24 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfceb-00HZMF-12;
	Mon, 11 Sep 2023 08:52:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-573d52030fbso2632283a12.0;
        Mon, 11 Sep 2023 01:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694422338; x=1695027138; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b6ojjoj528580DYzIEP6XgoOL7aePsN/TYuceJeg3YE=;
        b=QGDOtlnXaxTJPDRUsf4/LPZsUpLkz68WBy4xskzmMFvjHWBBUlyVvt3AobnUIvRZdx
         os/5pDqdAXr974Olh6JdoOMR8darbyreOYLhllMguBvOnid+sjCU8QnKG1+/u/EHe/U7
         ad8PvEauzCugRY3zj2KczAd47Xw/iXr8O7noFH8easoHDpFiWChMaIRSBBnsZjizmp2R
         gFBUO/ZsdusPTTc0qTL7XgMmAaOpWR8YUXvM6wvFYRcwPlVkxnePOywcm4hpSb3UteFi
         entZVZezxTRNN8ZXFFBfAe5OnuaG9vKWG1p19QD2SSQ+m0SuZMQ4fO3SGy8fpL/oCXb6
         1vWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694422338; x=1695027138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6ojjoj528580DYzIEP6XgoOL7aePsN/TYuceJeg3YE=;
        b=WvBFeKILlg3xcv7h5pBrK+GlV7NAmK+1el3dGumHhZC/8Siapg34CqpYlZ4VvXSfko
         b37fiG3rOsJbI/wewiIqQXQAxaj5Ty5C2VbQU1wRy45vtUhEK8EG+97EYi/5IAYrEwGN
         xFNyp3qBlRpDTu/dU6oyF2Mp6cweH7TEaAonfUfBZST3YZefmhZu9gE/RM0IN7A694pU
         673DAlw36GYvQRikT9MdgP75NLdjf8v1Jh0xYDLlnxT0Wdufc3Jv0bxe+Vezj6XDOB80
         aitBvNz8yxzDcpv+i2roJ1VQ4vZyyJ5RI/k/p+5amqmRBWVm2XYgMZLw7Ly0vH78C5qa
         e14w==
X-Gm-Message-State: AOJu0YxusiHWlIBJLWMQYxJoO4TK4to4P+0C1KmkPLuXtmy1pZUNs44r
	7TSPfUdfVHmUKa/ezFbAW7k=
X-Google-Smtp-Source: AGHT+IGhmEWHLAYl0FOfBIxHzSVzPNiLLqpuyRPizVofbJudX36mjRJtfMF93gr9pzcoQUhJS9Y29Q==
X-Received: by 2002:a05:6300:8005:b0:14b:f9e2:e16c with SMTP id an5-20020a056300800500b0014bf9e2e16cmr6459218pzc.62.1694422338167;
        Mon, 11 Sep 2023 01:52:18 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902e9c500b001bb04755212sm5853976plk.228.2023.09.11.01.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 01:52:17 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id D1703830618D; Mon, 11 Sep 2023 15:52:13 +0700 (WIB)
Date: Mon, 11 Sep 2023 15:52:13 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>, <corbet@lwn.net>,
	<agross@kernel.org>, <andersson@kernel.org>,
	<konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<keescook@chromium.org>, <tony.luck@intel.com>,
	<gpiccoli@igalia.com>, <mathieu.poirier@linaro.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>,
	<linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
	<vigneshr@ti.com>, <nm@ti.com>, <matthias.bgg@gmail.com>,
	<kgene@kernel.org>, <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
	<quic_tsoni@quicinc.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>
Subject: Re: [PATCH v5 00/17] Add Qualcomm Minidump kernel driver related
 support
Message-ID: <ZP7VPfVtvbmB5aQf@debian.me>
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ypI1W5o4Aub9n7jF"
Content-Disposition: inline
In-Reply-To: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_015221_363609_1E19E753 
X-CRM114-Status: GOOD (  45.99  )
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


--ypI1W5o4Aub9n7jF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 10, 2023 at 01:46:01AM +0530, Mukesh Ojha wrote:
> Hi All,
>=20
> This is to continuation from the conversation happened at v4
>=20
> https://lore.kernel.org/lkml/632c5b97-4a91-c3e8-1e6c-33d6c4f6454f@quicinc=
=2Ecom/
>=20
> https://lore.kernel.org/lkml/695133e6-105f-de2a-5559-555cea0a0462@quicinc=
=2Ecom/
>=20
> We have put abstract on LPC on this topic as well as initiated a mail thr=
ead
> with other SoC vendors but did not get much traction on it.
>=20
> https://lore.kernel.org/lkml/0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc=
=2Ecom/
>=20
> We explored most of possiblity present in kernel to address this issue[1]=
 but
> solution like kdump/fadump does not seems safe/secure/performant from our
> perspective.
>=20
> Hence, with this series we tried to make the minidump kernel driver, simp=
le
> and tied with pstore frontends, so that it collects the present available
> frontends data like dmesg, ftrace, pmsg, ftrace., Also, we will be working
> towards enhancing generic pstore to capture more debug data which will be
> helpful for first hand of debugging that can benefit both other pstore us=
ers
> as well as us as minidump users.
>=20
> One of the proposal made here,
> https://lore.kernel.org/lkml/1683561060-2197-1-git-send-email-quic_mojha@=
quicinc.com/
>=20
> Looking forward for your comments.
>=20
> Thanks,
> Mukesh
>=20
> [1]
> Minidump is a best effort mechanism to collect useful and predefined data
> for first level of debugging on end user devices running on Qualcomm SoCs.
> It is built on the premise that System on Chip (SoC) or subsystem part of
> SoC crashes, due to a range of hardware and software bugs. Hence, the
> ability to collect accurate data is only a best-effort. The data collected
> could be invalid or corrupted, data collection itself could fail, and so =
on.
>=20
> Qualcomm devices in engineering mode provides a mechanism for generating
> full system ramdumps for post mortem debugging. But in some cases it's
> however not feasible to capture the entire content of RAM. The minidump
> mechanism provides the means for selecting which snippets should be
> included in the ramdump.
>=20
> The core of SMEM based minidump feature is part of Qualcomm's boot
> firmware code. It initializes shared memory (SMEM), which is a part of
> DDR and allocates a small section of SMEM to minidump table i.e also
> called global table of content (G-ToC). Each subsystem (APSS, ADSP, ...)
> has their own table of segments to be included in the minidump and all
> get their reference from G-ToC. Each segment/region has some details
> like name, physical address and it's size etc. and it could be anywhere
> scattered in the DDR.
>=20
> Existing upstream Qualcomm remoteproc driver[1] already supports SMEM
> based minidump feature for remoteproc instances like ADSP, MODEM, ...
> where predefined selective segments of subsystem region can be dumped
> as part of coredump collection which generates smaller size artifacts
> compared to complete coredump of subsystem on crash.
>=20
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/dri=
vers/remoteproc/qcom_common.c#n142
>=20
> In addition to managing and querying the APSS minidump description,
> the Linux driver maintains a ELF header in a segment. This segment
> gets updated with section/program header whenever a new entry gets
> registered.
>=20
> Changes in v5:
>  - On suggestion from Pavan.k, to have single function call for minidump =
collection
>    from remoteproc driver, separated the logic to have separate minidump =
file called
>    qcom_rproc_minidump.c and also renamed the function from qcom_minidump=
() to=20
>    qcom_rproc_minidump(); however, dropped his suggestion about rework on=
 lazy deletion
>    during region unregister in this series, will pursue it in next series.
>=20
>  - To simplify the minidump driver, removed the complication for frontend=
 and different
>    backend from Greg suggestion, will pursue this once main driver gets m=
ainlined.
>=20
>  - Move the dynamic ramoops region allocation from Device tree approach t=
o command line
>    approch with the introduction command line parsing and memblock reserv=
ation during
>    early boot up; Not added documentation about it yet, will add if it ge=
ts positive
>    response.
>=20
>  - Exporting linux banner from kernel to make minidump build also as modu=
le, however,
>    minidump is a debug module and should be kernel built to get most debu=
g information
>    from kernel.
>=20
>  - Tried to address comments given on dload patch series.=20
>=20
> Changes in v4: https://lore.kernel.org/lkml/1687955688-20809-1-git-send-e=
mail-quic_mojha@quicinc.com/
>  - Redesigned the driver and divided the driver into front end and backen=
d (smem) so
>    that any new backend can be attached easily to avoid code duplication.
>  - Patch reordering as per the driver and subsystem to easier review of t=
he code.
>  - Removed minidump specific code from remoteproc to minidump smem based =
driver.
>  - Enabled the all the driver as modules.
>  - Address comments made on documentation and yaml and Device tree file [=
Krzysztof/Konrad]
>  - Address comments made qcom_pstore_minidump driver and given its Device=
 tree
>    same set of properties as ramoops. [Luca/Kees]
>  - Added patch for MAINTAINER file.
>  - Include defconfig change as one patch as per [Krzysztof] suggestion.
>  - Tried to remove the redundant file scope variables from the module as =
per [Krzysztof] suggestion.
>  - Addressed comments made on dload mode patch v6 version
>    https://lore.kernel.org/lkml/1680076012-10785-1-git-send-email-quic_mo=
jha@quicinc.com/
>=20
> Changes in v3: https://lore.kernel.org/lkml/1683133352-10046-1-git-send-e=
mail-quic_mojha@quicinc.com/
>  - Addressed most of the comments by Srini on v2 and refactored the minid=
ump driver.
>     - Added platform device support
>     - Unregister region support.
>  - Added update region for clients.
>  - Added pending region support.
>  - Modified the documentation guide accordingly.
>  - Added qcom_pstore_ramdump client driver which happen to add ramoops pl=
atform
>    device and also registers ramoops region with minidump.
>  - Added download mode patch series with this minidump series.
>     https://lore.kernel.org/lkml/1680076012-10785-1-git-send-email-quic_m=
ojha@quicinc.com/
>=20
> Changes in v2: https://lore.kernel.org/lkml/1679491817-2498-1-git-send-em=
ail-quic_mojha@quicinc.com/
>  - Addressed review comment made by [quic_tsoni/bmasney] to add documenta=
tion.
>  - Addressed comments made by [srinivas.kandagatla]
>  - Dropped pstore 6/6 from the last series, till i get conclusion to get =
pstore
>    region in minidump.
>  - Fixed issue reported by kernel test robot.
>=20
> Changes in v1: https://lore.kernel.org/lkml/1676978713-7394-1-git-send-em=
ail-quic_mojha@quicinc.com/
>=20
> Testing of the patches has been done on sm8450 target after enabling conf=
ig like
> CONFIG_PSTORE_RAM and CONFIG_PSTORE_CONSOLE and once the device boots up.
>=20
>  echo mini > /sys/module/qcom_scm/parameters/download_mode
>=20
> Try crashing it via devmem2 0xf11c000(this is known to create xpu violati=
on and
> and put the device in download mode) on command prompt.
>=20
> Default storage type is set to via USB, so minidump would be downloaded w=
ith the
> help of x86_64 machine (running PCAT tool) attached to Qualcomm device wh=
ich has
> backed minidump boot firmware support.
>=20
> This will make the device go to download mode and collect the minidump on=
 to the
> attached x86 machine running the Qualcomm PCAT tool(This comes as part Qu=
alcomm
> package manager kit).
>=20
> After that we will see a bunch of predefined registered region as binary =
blobs files
> starts with md_* downloaded on the x86 machine on given location in PCAT =
tool from
> the target device, more about this can be found in qualcomm minidump guid=
e patch.
>=20

I tried to apply this series on top of 535a265d7f0dd50 (as suggested by
`b4 am -l -g`), but it conflicts on patch [04/17]. Please specify the
exact base commit or another series for which this series is based on.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ypI1W5o4Aub9n7jF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZP7VOQAKCRD2uYlJVVFO
o7CQAP9vjj875+yfOt9mTMP/2aP+Bk2gV8aoKpSZbVrr0OHt+wEAsUPrYs7dB28e
9vo5VB+FpC5Y8n97acr+wNXUrD6klAk=
=WCfb
-----END PGP SIGNATURE-----

--ypI1W5o4Aub9n7jF--

