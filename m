Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BCEC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 05:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NX4xnb+Y6UTiviuMBl/tewe6sCua/bVxOuCKRZ4I0bo=; b=0eHjyJcZ0ctbIlLGbINwwQMVbg
	+PSprDGJL8MwZSVuyUcfZBbfiD33iV5IKW0MYZBET3RpBT8WHX5W2Hm0W87gsYUqT6rn7TMftDOY6
	OS5n6o6j817sep5x9PlTT27LcrkV+fgVFUW1VpdlSTYLh9dWuLN1TIY5QBWzFj3ZtGzqU4kCEQFnG
	hBApiAx/a0LflTTt5fJQq+JICfVsFRjZkiqV3rccbyF6CvnmKAWcLa03Bs65jOzGI0VAoXgPrx1hz
	+ZOl1RdjLownDGxwoW7c17HQvLb/iuBGGnlBhSDCVS7xfvjiCzSkuRd+RtqdHL0lfPaEr5+vtH3ML
	tBlLUC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7UKw-001QGm-3C;
	Mon, 27 Nov 2023 05:39:15 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7UKs-001QFl-1I;
	Mon, 27 Nov 2023 05:39:12 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6cb9dd2ab56so3175921b3a.3;
        Sun, 26 Nov 2023 21:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701063545; x=1701668345; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NX4xnb+Y6UTiviuMBl/tewe6sCua/bVxOuCKRZ4I0bo=;
        b=cybEbm26oTbm6ChMQjQn8ViwEFjjZowq6z5zWXi8YFiFjkiSQEgiZPCogSZxy7bQ6O
         8fWGRighDwMrQeL+8dN96SiEFOEUQUhcQ4oWPvf/vGA8Mtlay27XRWDqHIFePrfxU0kk
         K8IhLRn7b8/Ye9ryFdGoL/QEvTkakvexxDIwq+gf/lQTtkzE6NmPviNTJHqis1gaqeRV
         RMtTK0iEaO6woZ0Yj7d2QEeJH8lvfhlEp9iaDdQvYpbVHIq7QJ8PRW4nWF3g5CWP93nt
         eWUpAzgVx38i7mz58Quv9R4PeV2KB5vYwzVkUh/G3qEYZRwYHjRgE3ACYSuVblBU5QYO
         Ym4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063545; x=1701668345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX4xnb+Y6UTiviuMBl/tewe6sCua/bVxOuCKRZ4I0bo=;
        b=Tc8boSqrosqZuEgPRPpxy0kAdGC2dVaGRToAXK8yzC/WecskQVIU1XQ/epOtO6tLGU
         ix2+PqV2R4Qg5t4ExYcEVd2JSZPLz3UO5sWHcE+jyb3pIjhoLV8K5dq3OGjjyvN+iJCa
         JHV/1Iwt3PViQ/vcilHS92aYb3JWpFZPdfR2pCSI8FaWjQKdkqAUA6fOXKb+aZVS44oQ
         6t0sQVNhPHonAB1UW+gCvAuMQssOXVDeiw9Tk0GtivqjFa0vyhXlfDdRcQ4Lc46xtqlt
         VFymIBKcI9jI0tAor2rNoHbrlyA0pQpwic1GuShp3pmDNmEdRxmjVR4I0wAKxyjKN/1H
         jvrg==
X-Gm-Message-State: AOJu0Yw9x0N7vVmY2+B5x1tJ9QXTJ1lgVOhW43XMGzFy5Hp/Rj6Bk/mS
	q9aSHYKYAMQgrDAgSIFZu0s=
X-Google-Smtp-Source: AGHT+IEXfuisJUFusS+Gaj5RNsLQEjGTROBbYT0tKXPV6334Nlqt2LUywy6CWVwD0CXcxJLfxejR3Q==
X-Received: by 2002:a05:6a00:2d07:b0:6be:2991:d878 with SMTP id fa7-20020a056a002d0700b006be2991d878mr11641552pfb.15.1701063544569;
        Sun, 26 Nov 2023 21:39:04 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id gu23-20020a056a004e5700b006cb6fa32590sm6532374pfb.148.2023.11.26.21.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:39:03 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 70C781033A242; Mon, 27 Nov 2023 12:38:59 +0700 (WIB)
Date: Mon, 27 Nov 2023 12:38:59 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
	mathieu.poirier@linaro.org, vigneshr@ti.com, nm@ti.com,
	matthias.bgg@gmail.com, kgene@kernel.org, alim.akhtar@samsung.com,
	bmasney@redhat.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
Subject: Re: [Patch v6 03/12] docs: qcom: Add qualcomm minidump guide
Message-ID: <ZWQrc7w2AD2WvwkK@archie.me>
References: <1700864395-1479-1-git-send-email-quic_mojha@quicinc.com>
 <1700864395-1479-4-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BuCQw3fkz+a4hLx6"
Content-Disposition: inline
In-Reply-To: <1700864395-1479-4-git-send-email-quic_mojha@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_213910_446305_99E739E2 
X-CRM114-Status: GOOD (  47.00  )
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


--BuCQw3fkz+a4hLx6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 03:49:46AM +0530, Mukesh Ojha wrote:
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-gu=
ide/index.rst
> index 43ea35613dfc..251d070486c2 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -120,6 +120,7 @@ configure specific aspects of kernel behavior to your=
 liking.
>     perf-security
>     pm/index
>     pnp
> +   qcom_minidump
>     rapidio
>     ras
>     rtc
> diff --git a/Documentation/admin-guide/qcom_minidump.rst b/Documentation/=
admin-guide/qcom_minidump.rst
> new file mode 100644
> index 000000000000..b492f2b79639
> --- /dev/null
> +++ b/Documentation/admin-guide/qcom_minidump.rst
> @@ -0,0 +1,272 @@
> +Qualcomm minidump feature
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +Introduction
> +------------
> +
> +Minidump is a best effort mechanism to collect useful and predefined
> +data for first level of debugging on end user devices running on
> +Qualcomm SoCs. It is built on the premise that System on Chip (SoC)
> +or subsystem part of SoC crashes, due to a range of hardware and
> +software bugs. Hence, the ability to collect accurate data is only
> +a best-effort. The data collected could be invalid or corrupted, data
> +collection itself could fail, and so on.
> +
> +Qualcomm devices in engineering mode provides a mechanism for generating
> +full system RAM dumps for post-mortem debugging. But in some cases it's
> +however not feasible to capture the entire content of RAM. The minidump
> +mechanism provides the means for selected region should be included in
> +the ramdump.
> +
> +
> +::
> +
> +   +-----------------------------------------------+
> +   |   DDR                       +-------------+   |
> +   |                             |      SS0-ToC|   |
> +   | +----------------+     +----------------+ |   |
> +   | |Shared memory   |     |         SS1-ToC| |   |
> +   | |(SMEM)          |     |                | |   |
> +   | |                | +-->|--------+       | |   |
> +   | |G-ToC           | |   | SS-ToC  \      | |   |
> +   | |+-------------+ | |   | +-----------+  | |   |
> +   | ||-------------| | |   | |-----------|  | |   |
> +   | || SS0-ToC     | | | +-|<|SS1 region1|  | |   |
> +   | ||-------------| | | | | |-----------|  | |   |
> +   | || SS1-ToC     |-|>+ | | |SS1 region2|  | |   |
> +   | ||-------------| |   | | |-----------|  | |   |
> +   | || SS2-ToC     | |   | | |  ...      |  | |   |
> +   | ||-------------| |   | | |-----------|  | |   |
> +   | ||  ...        | |   |-|<|SS1 regionN|  | |   |
> +   | ||-------------| |   | | |-----------|  | |   |
> +   | || SSn-ToC     | |   | | +-----------+  | |   |
> +   | |+-------------+ |   | |                | |   |
> +   | |                |   | |----------------| |   |
> +   | |                |   +>|  regionN       | |   |
> +   | |                |   | |----------------| |   |
> +   | +----------------+   | |                | |   |
> +   |                      | |----------------| |   |
> +   |                      +>|  region1       | |   |
> +   |                        |----------------| |   |
> +   |                        |                | |   |
> +   |                        |----------------|-+   |
> +   |                        |  region5       |     |
> +   |                        |----------------|     |
> +   |                        |                |     |
> +   |  Region information    +----------------+     |
> +   | +---------------+                             |
> +   | |region name    |                             |
> +   | |---------------|                             |
> +   | |region address |                             |
> +   | |---------------|                             |
> +   | |region size    |                             |
> +   | +---------------+                             |
> +   +-----------------------------------------------+
> +       G-ToC: Global table of contents
> +       SS-ToC: Subsystem table of contents
> +       SS0-SSn: Subsystem numbered from 0 to n
> +
> +It depends on SoC where the underlying firmware is keeping the
> +minidump global table taking care of subsystem ToC part for
> +minidump like for above diagram, it is for shared memory sitting
> +in DDR and it is shared among various master however it is possible
> +that this could be implemented via memory mapped regions but the
> +general idea should remain same. Here, various subsystem could be
> +DSP's like ADSP/CDSP/MODEM etc, along with Application processor
> +(APSS) where Linux runs. DSP minidump gets collected when DSP's goes
> +for recovery followed by a crash. The minidump part of code for
> +that resides in ``qcom_rproc_minidump.c``.
> +
> +
> +SMEM as backend
> +----------------
> +
> +In this document, SMEM will be used as the backend implementation
> +of minidump.
> +
> +The core of minidump feature is part of Qualcomm's boot firmware code.
> +It initializes shared memory (SMEM), which is a part of DDR and
> +allocates a small section of it to minidump table, i.e. also called
> +global table of contents (G-ToC). Each subsystem (APSS, ADSP, ...) has
> +its own table of segments to be included in the minidump, all
> +references from a descriptor in SMEM (G-ToC). Each segment/region has
> +some details like name, physical address and its size etc. and it
> +could be anywhere scattered in the DDR.
> +
> +Qualcomm APSS Minidump kernel driver concept
> +--------------------------------------------
> +
> +Qualcomm APSS minidump kernel driver adds the capability to add Linux
> +region to be dumped as part of RAM dump collection. At the moment,
> +shared memory driver creates platform device for minidump driver and
> +give a means to APSS minidump to initialize itself on probe.
> +
> +This driver provides ``qcom_minidump_region_register`` and
> +``qcom_minidump_region_unregister`` API's to register and unregister
> +APSS minidump region. It also supports registration for the clients
> +who came before minidump driver was initialized. It maintains pending
> +list of clients who came before minidump and once minidump is initialized
> +it registers them in one go.
> +
> +To simplify post-mortem debugging, driver creates and maintain an ELF
> +header as first region that gets updated each time a new region gets
> +registered.
> +
> +The solution supports extracting the RAM dump/minidump produced either
> +over USB or stored to an attached storage device.
> +
> +Dependency of minidump kernel driver
> +------------------------------------
> +
> +It is to note that whole of minidump depends on Qualcomm boot firmware
> +whether it supports minidump or not. So, if the minidump SMEM ID is
> +present in shared memory, it indicates that minidump is supported from
> +boot firmware and it is possible to dump Linux (APSS) region as part
> +of minidump collection.
> +
> +How a kernel client driver can register region with minidump
> +------------------------------------------------------------
> +
> +Client driver can use ``qcom_minidump_region_register`` API's to register
> +and ``qcom_minidump_region_unregister`` to unregister their region from
> +minidump driver.
> +
> +Client needs to fill their region by filling ``qcom_minidump_region``
> +structure object which consists of the region name, region's virtual
> +and physical address and its size.
> +
> +Below, is one sample client driver snippet which tries to allocate a
> +region from kernel heap of certain size and it writes a certain known
> +pattern (that can help in verification after collection that we got
> +the exact pattern, what we wrote) and registers it with minidump.
> +
> + .. code-block:: c
> +
> +  #include <soc/qcom/qcom_minidump.h>
> +  [...]
> +
> +
> +  [... inside a function ...]
> +  struct qcom_minidump_region region;
> +
> +  [...]
> +
> +  client_mem_region =3D kzalloc(region_size, GFP_KERNEL);
> +  if (!client_mem_region)
> +	return -ENOMEM;
> +
> +  [... Just write a pattern ...]
> +  memset(client_mem_region, 0xAB, region_size);
> +
> +  [... Fill up the region object ...]
> +  strlcpy(region.name, "REGION_A", sizeof(region.name));
> +  region.virt_addr =3D client_mem_region;
> +  region.phys_addr =3D virt_to_phys(client_mem_region);
> +  region.size =3D region_size;
> +
> +  ret =3D qcom_minidump_region_register(&region);
> +  if (ret < 0) {
> +	pr_err("failed to add region in minidump: err: %d\n", ret);
> +	return ret;
> +  }
> +
> +  [...]
> +
> +
> +Test
> +----
> +
> +Existing Qualcomm devices already supports entire RAM dump (also called
> +full dump) by writing appropriate value to Qualcomm's top control and
> +status register (tcsr) in ``driver/firmware/qcom_scm.c`` .
> +
> +SCM device Tree bindings required to support download mode
> +For example (sm8450) ::
> +
> +	/ {
> +
> +	[...]
> +
> +		firmware {
> +			scm: scm {
> +				compatible =3D "qcom,scm-sm8450", "qcom,scm";
> +				[... tcsr register ... ]
> +				qcom,dload-mode =3D <&tcsr 0x13000>;
> +
> +				[...]
> +			};
> +		};
> +
> +	[...]
> +
> +		soc: soc@0 {
> +
> +			[...]
> +
> +			tcsr: syscon@1fc0000 {
> +				compatible =3D "qcom,sm8450-tcsr", "syscon";
> +				reg =3D <0x0 0x1fc0000 0x0 0x30000>;
> +			};
> +
> +			[...]
> +		};
> +	[...]
> +
> +	};
> +
> +User of minidump can pass ``qcom_scm.download_mode=3D"mini"`` to kernel
> +commandline to set the current download mode to minidump.
> +Similarly, ``"full"`` is passed to set the download mode to full dump
> +where entire RAM dump will be collected while setting it ``"full,mini"``
> +will collect minidump along with fulldump.
> +
> +Writing to sysfs node can also be used to set the mode to minidump::
> +
> +	echo "mini" > /sys/module/qcom_scm/parameter/download_mode
> +
> +Once the download mode is set, any kind of crash will make the device co=
llect
> +respective dump as per set download mode.
> +
> +Dump collection
> +---------------
> +::
> +
> +	+-----------+
> +	|           |
> +	|           |         +------+
> +	|           |         |      |
> +	|           |         +--+---+ Product(Qualcomm SoC)
> +	+-----------+             |
> +	|+++++++++++|<------------+
> +	|+++++++++++|    usb cable
> +	+-----------+
> +            x86_64 PC
> +
> +The solution supports a product running with Qualcomm SoC (where minidum=
p)
> +is supported from the firmware) connected to x86_64 host PC running PCAT
> +tool. It supports downloading the minidump produced from product to the
> +host PC over USB or to save the minidump to the product attached storage
> +device(UFS/eMMC/SD Card) into minidump dedicated partition.
> +
> +By default, dumps are downloaded via USB to the attached x86_64 PC runni=
ng
> +PCAT (Qualcomm tool) software. Upon download, we will see a set of binary
> +blobs starting with name ``md_*`` in PCAT configured directory in x86_64
> +machine, so for above example from the client it will be ``md_REGION_A.B=
IN``.
> +This binary blob depends on region content to determine whether it needs
> +external parser support to get the content of the region, so for simple
> +plain ASCII text we don't need any parsing and the content can be seen
> +just opening the binary file.
> +
> +To collect the dump to attached storage type, one needs to write appropr=
iate
> +value to IMEM register, in that case dumps are collected in rawdump
> +partition on the product device itself.
> +
> +One needs to read the entire rawdump partition and pull out content to
> +save it onto the attached x86_64 machine over USB. Later, this rawdump
> +can be passed to another tool (``dexter.exe`` [Qualcomm tool]) which
> +converts this into the similar binary blobs which we have got it when
> +download type was set to USB, i.e. a set of registered regions as blobs
> +and their name starts with ``md_*``.
> +
> +Replacing the ``dexter.exe`` with some open source tool can be added as =
future
> +scope of this document.

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--BuCQw3fkz+a4hLx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWQrbQAKCRD2uYlJVVFO
o16CAQC7qBNMo3GAelqbYCC7X0VFYpjeiiqcRiy6GrizoTGcCgD8D5mzVjQfqBvY
bh6PeiYqzBUUfBhACG4CtQpxBGryGwk=
=BPu8
-----END PGP SIGNATURE-----

--BuCQw3fkz+a4hLx6--

