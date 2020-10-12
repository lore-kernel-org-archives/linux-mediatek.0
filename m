Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D7CC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 05:47:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1191920665
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 05:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+acxxB+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HSQ6gaQ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1191920665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fI/57kocEIHXdAT/aYEjr9gtBNfisKXCMoPZ7PGtdjg=; b=s+acxxB+UcvtP0ayGL3dU7974
	yfeDoeNK5EEk5Vu096fC2hn9laziDZChf4ovaODafzosAqtBP5L9ilREcSCzERVzJAsiWVS2neIlQ
	jz3wVZTWDSatow3PWZ2IeRT6qgzoIrSrVpR7hGAajCrCGKfX79/XeOa8tnbt762dneG2tT2wKtaN0
	XgfJwYB41Ytjx1ocE2fgj+maR5usSUQNcHgyDWfq/e/1IHNiRId5Ft78jjzRXv1kqVWDL4rbzV+PE
	Rf+IWeibrIvyOYhK5UuTwTMnLHoh0CppHX5cRDiP9LPtwWCnLKNgkkb5FBdX85cWk8iYyF9l0Ch+B
	c3TU84w0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRqgP-00016x-VR; Mon, 12 Oct 2020 05:47:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRqgM-00015y-P8; Mon, 12 Oct 2020 05:47:39 +0000
X-UUID: 6838b513ae7446d5b0ff7957d702825e-20201011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Qh32CvLCP7TbrAU9q4uRS7WfIF5HB8P3kFRMssgVV8s=; 
 b=HSQ6gaQ9BT/8awzojpsomr6j0MvxxgkGnmo4bMBO0/udns3AnarywMX9wZUTFmhPjwk423W2hEk1Jls9qEBq0WBjHIwhD1UXHdl/qYS/j7sc6HWD9fmo09CE97oUvdpaeKPvC7lvRnw4RBN2eg8/7u2CvsJmra6sq4or7IFFG0M=;
X-UUID: 6838b513ae7446d5b0ff7957d702825e-20201011
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1516972711; Sun, 11 Oct 2020 21:47:30 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 22:47:28 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 12 Oct 2020 13:47:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Oct 2020 13:47:25 +0800
Message-ID: <1602481646.8921.4.camel@mhfsdcap03>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: mt8192: add audio afe document
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 12 Oct 2020 13:47:26 +0800
In-Reply-To: <20201005135503.GA86716@bogus>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
 <20201005135503.GA86716@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_014738_945295_243D6429 
X-CRM114-Status: GOOD (  17.16  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, tzungbi@google.com, broonie@kernel.org,
 maowenan@huawei.com, tiwai@suse.com, shane.chien@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-10-05 at 08:55 -0500, Rob Herring wrote:
> On Fri, 02 Oct 2020 15:35:40 +0800, Jiaxin Yu wrote:
> > This patch adds mt8192 audio afe document.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >  .../bindings/sound/mt8192-afe-pcm.yaml        | 98 +++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
>    19 |         #include <dt-bindings/clock/mt8192-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1366: dt_binding_check] Error 2
> 
> 
> See https://patchwork.ozlabs.org/patch/1375582
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 
Sorry, I should add a dependency description.
"dt-bindings/clock/mt8192-clk.h" is included in
https://patchwork.kernel.org/cover/11752231 series of patches, but they
has not been accepted.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
