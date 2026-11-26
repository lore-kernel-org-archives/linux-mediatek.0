Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97519606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dk7p4xb8;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zg0CSego
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WsVj4KD5V6xD96iJwBwjksOcEJnqev9LYjORmDnLPlc=; b=dk7p4xb8NqQQT0JzvNFjdvs4nj
	xLaQJBoqAE9PsI+xJdTxfpUou/4KP6QEIjFg92Eyd8an72x5TVl+LOFHUoMMtwIUEBTAK1okI7G6E
	zUd+5VlBQV2U3rI1tA8hqLP6VcVHbfQ2D8n0N02FJDKPsJ4QdslVzYlkOY6yuYxs5iIpg8ej85kfQ
	lpvTHfmhWhrBtugeZWG1+HkVjyY4ih8Atkj6Um+LEDFBFMcflpOtlkHL/K3lCqHkO6q6i/I9b2a1L
	C8f7ytPVgpdLLCgAodzRxZDfQkYfKF4qpBl+clcLJ89v75ePH4I73FH1XqOvekpFuq3jer3m/7lsg
	lmuZzeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVgG-0000000CXrz-16JI;
	Thu, 26 Nov 2026 09:22:16 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVfz-0000000CXmE-2UgV;
	Thu, 26 Nov 2026 09:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795684920; x=1827220920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/hUGbjPNZAXU3qQnNIV8GlX5cXk7v+mn0wYdmIzb0eU=;
  b=Zg0CSegoJ2OhgJTD3Ve0KUfczCp8BOIHNaZBpF2MVNJ/JmHGQXTys2nY
   WHtRsxaSqt5AMH1dJGW/0/mQUPa+NEHP0p7AVUZJ7+BqLzc3xMLHa8YcI
   kZt9b+y/Pc390RgQ9YoWTloAIcq7FH/XNHxd1B/NumkpcYko4d4CYEdBK
   d9UYzW1Z2+IIcholYO02AGJEMmGDgj4cELePlJgN8G77WwnY9n0U6unVG
   ukUBmAlhlYKYwzxL0zgDPPz7OQzv8tW/T5WkdscjytDNo4Pllut2OWFFz
   nnsHGCnvF4AyHs51N788e399TpQZf8KHCrnR5KQhMtT39aMf4f+eiZTlp
   g==;
X-CSE-ConnectionGUID: NvlBYV8lTbamFdqLPv3Wdw==
X-CSE-MsgGUID: AEW6HnaKRdqxCwJWkTVq8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4498455"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4498455"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 01:21:58 -0800
X-CSE-ConnectionGUID: jqxrnSvsRzmWjcz3YEn4gQ==
X-CSE-MsgGUID: l+VlTFImRlOObP/9iDbUMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12122503"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2026 01:21:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5CCAA98; Thu, 26 Nov 2026 10:21:53 +0100 (CET)
Date: Thu, 26 Nov 2026 10:21:53 +0100
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 7/8] thunderbolt: Decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Message-ID: <20261126092153.GN191152@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-8-chunfeng.yun@mediatek.com>
 <20261124160038.GR229695@black.igk.intel.com>
 <269e96946472c8562657fa1b40f24a17ee52b447.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <269e96946472c8562657fa1b40f24a17ee52b447.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_012159_659755_5E4E90A6 
X-CRM114-Status: GOOD (  20.43  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 08:48:54AM +0000, Chunfeng Yun (云春峰) wrote:
> On 二, 2026-11-24 at 17:00 +0100, Mika Westerberg wrote:
> > On Mon, Nov 23, 2026 at 07:36:54PM +0800, Chunfeng Yun wrote:
> > > When USB4 is woke up by device disconnect, no need wait for 2s,
> > > usually the phase2~4 takes at most about 200ms, and enters to
> > 
> > usually phases 2-4 take at most..
> > 
> > The 200ms is not from the spec though? It's empirical right on your
> > hardhware?
> 
> Yes, you are right. The ~200ms is empirical based on testing on our
> hardware with various USB4 docks and devices, rather than a hard limit
> from the spec.
> 
> In the USB4 spec, the lane adapter stays in CLd (TB_PORT_UNPLUGGED)
> throughout Phases 2-4 until it sends LT_Resume at the end of Phase 4 to
> enter Training (TB_PORT_CONNECTING), and the spec does not define an
> overall maximum timeout for Phases 2-4. At the protocol level, Phase 2
> (tConnectRx), Phase 3 (AT transactions), and Phase 4 (tLTPhase4 and
> Broadcast RT transactions) only take tens of milliseconds; in practice,
> the ~100-200ms delay mainly comes from partner router wake-up, re-timer
> initialization, etc.
> 
> So I doubled that empirical ~200ms to 400ms as a safety margin.
> 
> I will clarify in the commit message that this is an empirical value in
> v4. Do you think 400ms is fine here, or would you prefer 500ms to leave
> a bit more margin for active cables and older Thunderbolt switches?

This has been working fine so far so no need.

