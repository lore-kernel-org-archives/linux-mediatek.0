Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89180C43381
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 06:58:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CB3364F61
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 06:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CB3364F61
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d5LbP8owoA0BYWQ/S2ZpJToejZ6a+biw790sK+qNcOE=; b=ojO4CkTXOfr6TzPgbKwaAMIIQ
	WHxBzdsY5quvimUFEZfmLDEtmiI411lX2Waq6+MtyxuRlvOQv96eKDjEWPkl6GkW5wMjov0ff5BYd
	I+A95Rh5Q8UjoTPEYY4U8Vs8Ju4cA7kenKbtm0j+Zs+4nvQlZzRraIi2HA6s6bwUyohoOAhnrRihw
	5yPgwW7pxjyLxom+Y7IrvYpXtskNb6BnDy1jqhdTNEmQQqmwRNB4jL1u7PVUO0AwYBsdPbAMhhvQA
	OpB/QiZbzIvpLfeF0qxUiyzqan9UKOWkpvnB2aoUdLiYsz2/yZRUiZYGGh7bdke9iRLApSxeK+Pfi
	NNrv+bTzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7C71-0003WZ-JG; Wed, 03 Feb 2021 06:58:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7C6x-0003VR-Ff; Wed, 03 Feb 2021 06:58:01 +0000
X-UUID: ab1ca6a0780942c1825f1bbce6d03180-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xRMlI2EADtM4gae429sxpvqn+NvYbc5cVgo4D59hErQ=; 
 b=BT4M3PrsQ5TGCxdMvQMoEw82htr4KY49+wSBhScM0I4Mgp6CZPdigPsdoyqjhkLNFyJ1gW7bGmptO7phCBeRKL+llB2dnBgiG/D6RtueM043GNLl0kVDgngD1wmuYcqBJy6hERGLiMJOhqFfXzBZ7atfJkElpdDyBrmhzZrbRDU=;
X-UUID: ab1ca6a0780942c1825f1bbce6d03180-20210202
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1436770136; Tue, 02 Feb 2021 22:57:52 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 22:57:44 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 14:57:43 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Feb 2021 14:57:43 +0800
Message-ID: <1612335462.9202.1.camel@mtkswgap22>
Subject: Re: [PATCH 0/2] Add mediatek MT6359 accdet driver
From: Argus Lin <argus.lin@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Wed, 3 Feb 2021 14:57:42 +0800
In-Reply-To: <1609935546-11722-1-git-send-email-argus.lin@mediatek.com>
References: <1609935546-11722-1-git-send-email-argus.lin@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_015759_713886_C06EB768 
X-CRM114-Status: GOOD (  13.18  )
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
Cc: Jack Yu <jack.yu@realtek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ChiPeng Chang =?UTF-8?Q?=28=E5=BC=B5=E7=90=A6=E6=9C=8B=29?=
 <chipeng.chang@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Shane Chien =?UTF-8?Q?=28=E7=B0=A1=E4=BD=91=E8=BB=92=29?=
 <Shane.Chien@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?=
 <Jiaxin.Yu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dan Murphy <dmurphy@ti.com>, Shuming Fan <shumingf@realtek.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 wsd_upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear maintainers:
Can you reply to me if any opinion?
thanks

B.R.
Argus

On Wed, 2021-01-06 at 20:19 +0800, Argus Lin wrote:
> MT6359 audio codec support accessory detect features, the general features
> are jack plug detection and key detection.
> 
> All of 3-pole and 4-pole jack are supported.
> 
> change since v1:
>   - adds mt6359 accdet binding document
>   - adds mt6359 accdet driver
> 
> 
> Argus Lin (2):
>   dt-bindings: mediatek: mt6359: add ASoC mt6359 accdet document
>   ASoC: mediatek: mt6359: add MT6359 accdet driver
> 
>  .../devicetree/bindings/sound/mt6359-accdet.yaml   |  142 ++
>  sound/soc/codecs/Kconfig                           |    7 +
>  sound/soc/codecs/Makefile                          |    2 +
>  sound/soc/codecs/mt6359-accdet.c                   | 1951 ++++++++++++++++++++
>  sound/soc/codecs/mt6359-accdet.h                   |  136 ++
>  sound/soc/codecs/mt6359.h                          | 1863 +++++++++++++++++--
>  6 files changed, 3995 insertions(+), 106 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
>  create mode 100644 sound/soc/codecs/mt6359-accdet.c
>  create mode 100644 sound/soc/codecs/mt6359-accdet.h
> 
> --
> 1.8.1.1.dirty
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
