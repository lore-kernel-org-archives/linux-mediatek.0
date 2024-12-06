Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141BEE7717F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2024 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/P5NvV/oPgyLOVDdO9jbE313zKQetWBog6B0EvuLEA=; b=jp97BWYLb9isjJj5TOytNjd+aJ
	b6zOw7POuc3x1KpLsT7JaQuQq3u36LZ06i+8sI6K/IiVZskYFQy8Dpnz2G6QZMWyNTIBvo5sFKFzd
	QtcnM6ee+IrhCFIRyv8fR7JaB4cUphARchQt/P5kSbATaydVRGSikdYTkeTHu5L3SAGS2bCZHBj6L
	nLX1siXE451CAmsncX7ncCkj8lTeJsgXAsDmpD7DAfgRhGQTAWXgEqt8lgaJDiWVBBS2Wk1s3jvYT
	zl6LJJPFU0Eo/SIk2wnMz8vHnkuIDvCEkiHfGBpu2iwMz/oBasOlAuEiphS/ywFnrezpTsITSRXpL
	FQwzibmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYkx-00000001m04-0BGB;
	Fri, 06 Dec 2024 13:52:31 +0000
Received: from flow-b5-smtp.messagingengine.com ([202.12.124.140])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYkq-00000001lsH-06Hi
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Dec 2024 13:52:25 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.stl.internal (Postfix) with ESMTP id 158141D40557;
	Fri,  6 Dec 2024 08:52:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Fri, 06 Dec 2024 08:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1733493138; x=
	1733500338; bh=F/P5NvV/oPgyLOVDdO9jbE313zKQetWBog6B0EvuLEA=; b=M
	Sj7guEpfYyfJVeSxZkmsMh0zyS2W2XOGFWxV1S085lP0oWUiSQf+HQv4B/im8Smb
	A/50JTK4DLLh18J9Sjqs2aNhk6S2yarJ+EHcouloSh/oqCB7hArt2q3ZuIFbkj/I
	fFgU9Qg9R5ZGGvT47CzpDp1KUbo7nK9HO2ae1NPXsXP/wl5BchFWD0yg/JCYjsr9
	fXIJRALKFsKvFqe71MneVTz8jaGQLkP6wUACGnoi/5zIDs6FZV9i4SCRlzylZIdL
	JEk2HHQSDWp63JDjM2qb1hil4JrLTf5nQRDL1cyESz6dFceNZAlsmT22L0W8F1gH
	86D9/srMF3PNNTLIIkUqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1733493138; x=1733500338; bh=F/P5NvV/oPgyLOVDdO9jbE313zKQetWBog6
	B0EvuLEA=; b=xDNgtnHy1tK7puhnLX5+esK/IgziPC4HzD0yPzyaPgVs8BauerX
	5Gh9QHIIwI9c+CUD9aR7FksVyc+wiv9c8kDcmUBxhh3LvOEfxlVik7VuxrqmuwTf
	XafAHjl0THPYXeq+RMCHSq+xyRbTf81BcpKLtm5vGNbxwyK3XhqSKKD0/eNEBIEs
	ifGsiqyf80HwoUEiHyMx99sbVBdhIbumQXWTwZBPE4uZQkwcPkqT1sz1khwQ5fKP
	5LvTH20FG+Z0W6OgHmIRX0xxkcJ4AsJgifC3XCJZIrNaVdO1xmRRG8EZSEdZAiGB
	55jZB+7jQTMglESe+lwBG7aRRXR4qQbb60A==
X-ME-Sender: <xms:kgFTZ9eRxZgsQ_HyW0NQeyBhAa8qrP-js82jZsEnrc73rIKbqI5cQg>
    <xme:kgFTZ7NeULk2V4bgBoKUbD2I9wnDfcKDJoG1qVHeHqzZoP8DCptzP2hkGxpDbhB_u
    HTxZFgGNz0vK71z6CA>
X-ME-Received: <xmr:kgFTZ2h8sZq6o250A96V6I672leVJ0PaesW6z8yf8EHC8ehGiJXlNNIQaY-eGODpBFung7qO_vhuMVEX_XB2I8ZKk7sWPvGZxo8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieelgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecu
    hfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueff
    veevueeftdelhfejieeitedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgt
    tghhihdrjhhppdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepiihijhhunhgphhhusehitghlohhuugdrtghomhdprhgtphhtthhopehgrhgv
    ghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehukhhlvg
    hinhgvkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrmhgvshdrsghothhtohhm
    lhgvhieshhgrnhhsvghnphgrrhhtnhgvrhhshhhiphdrtghomhdprhgtphhtthhopehthh
    homhgrshesthdqkegthhdruggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhvughimhhmsehlihhsthhsrd
    hlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehsphgrrhgtlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:kgFTZ2_UGngVtygK4_p0LKXvJr2g0v9oePYeEVcrzT0gkzTro-YK0g>
    <xmx:kgFTZ5vx35KJMQHqHYcHa0QjhtFrNmuU_ZD5-UGD0krqFfoJC4mPyQ>
    <xmx:kgFTZ1G9NWKiaU4m6BL1Na5OaZRNRdHCaRGEc0E-ttIN_XuEHc32wg>
    <xmx:kgFTZwPzQVAELvWI33zBnvWj1s6ncPtql6n1UYpP22HdnXi_-3k-FA>
    <xmx:kgFTZ4-yVlVkD3Q8ajGh0oXdOkDvMdTtHW1-CAta77ld53oKIK-nLbK0>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Dec 2024 08:52:12 -0500 (EST)
Date: Fri, 6 Dec 2024 22:52:09 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com,
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v3 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
Message-ID: <20241206135209.GA133715@workstation.local>
Mail-Followup-To: Zijun Hu <zijun_hu@icloud.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com,
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_055224_760741_97DE4A35 
X-CRM114-Status: GOOD (  13.37  )
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

On Thu, Dec 05, 2024 at 08:10:13AM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Constify the following API:
> struct device *device_find_child(struct device *dev, void *data,
> 		int (*match)(struct device *dev, void *data));
> To :
> struct device *device_find_child(struct device *dev, const void *data,
>                                  device_match_t match);
> typedef int (*device_match_t)(struct device *dev, const void *data);
> with the following reasons:
> 
> - Protect caller's match data @*data which is for comparison and lookup
>   and the API does not actually need to modify @*data.
> 
> - Make the API's parameters (@match)() and @data have the same type as
>   all of other device finding APIs (bus|class|driver)_find_device().
> 
> - All kinds of existing device match functions can be directly taken
>   as the API's argument, they were exported by driver core.
> 
> Constify the API and adapt for various existing usages by simply making
> various match functions take 'const void *' as type of match data @data.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  arch/sparc/kernel/vio.c                |  6 +++---
>  drivers/base/core.c                    |  6 +++---
>  drivers/block/sunvdc.c                 |  6 +++---
>  drivers/bus/fsl-mc/dprc-driver.c       |  4 ++--
>  drivers/cxl/core/pci.c                 |  4 ++--
>  drivers/cxl/core/pmem.c                |  2 +-
>  drivers/cxl/core/region.c              | 21 ++++++++++++---------
>  drivers/firewire/core-device.c         |  4 ++--
>  drivers/firmware/arm_scmi/bus.c        |  4 ++--
>  drivers/firmware/efi/dev-path-parser.c |  4 ++--
>  drivers/gpio/gpio-sim.c                |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 +-
>  drivers/hwmon/hwmon.c                  |  2 +-
>  drivers/media/pci/mgb4/mgb4_core.c     |  4 ++--
>  drivers/nvdimm/bus.c                   |  2 +-
>  drivers/pwm/core.c                     |  2 +-
>  drivers/rpmsg/rpmsg_core.c             |  4 ++--
>  drivers/scsi/qla4xxx/ql4_os.c          |  3 ++-
>  drivers/scsi/scsi_transport_iscsi.c    | 10 +++++-----
>  drivers/slimbus/core.c                 |  8 ++++----
>  drivers/thunderbolt/retimer.c          |  2 +-
>  drivers/thunderbolt/xdomain.c          |  2 +-
>  drivers/tty/serial/serial_core.c       |  4 ++--
>  drivers/usb/typec/class.c              |  8 ++++----
>  include/linux/device.h                 |  4 ++--
>  include/scsi/scsi_transport_iscsi.h    |  4 ++--
>  net/dsa/dsa.c                          |  2 +-
>  tools/testing/cxl/test/cxl.c           |  2 +-
>  28 files changed, 66 insertions(+), 62 deletions(-)

For the changes in FireWire subsystem:

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto

