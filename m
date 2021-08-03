Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAE2C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 18:24:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B09B460EE8
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 18:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B09B460EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ck17zV7fE1XpqJV/eo0GfDSIM50naWWXwSkD7C/VVL4=; b=j6OkWRqxTqntyv
	k6YVTA5L6NhtPbouD8EMqv2aURJZXVSAbonfNp0an1Gu9DC7EM5NljcSBhrAYptZPDxd4/wDUMSZP
	Ox65snc+FDl/w1bYDZ3TkFCscT6avSg+g9j2IX62rl+UTiF/+gSwiWJt6WGAy/KVtRoqdmC9w+l/4
	RhGQNHlUK2i7PiFYRoxVAo3hzj4feCb5+31KE76WgfcL0eemMSd7lI2IKugMsSgWjvCRVC6kaZjOy
	aETIh+k7ocHxdOUIvfUGDONrgHqGmcWKIb7YYOVuJviqqCn4BRSqqdFMSsQoB2GeCMX49LuMY4nvY
	wtPg5PxFtFw/kzD8w7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAz4w-003uGN-Ep; Tue, 03 Aug 2021 18:23:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAz4j-003uDy-Q8; Tue, 03 Aug 2021 18:23:39 +0000
Received: by mail-ej1-x634.google.com with SMTP id h9so22286425ejs.4;
 Tue, 03 Aug 2021 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RA+iQWQTeYlsLY2I1OK863JprrWYyeqL7Fz/PQqMnUA=;
 b=sjXLmJ7eWfTfzpvQU57ZaF/6XY2NLa+WYw0zN2WeKFlfbSSH2lgKk+eHaGlyXjrgP9
 AMkTzoqphifICTbi6DJ+X/IYjGwSEOgcPs73DfNqzu9FxYqB+SGI/alMYgB0+Xh8vl0B
 XETer64OR2YMk2qr347HeNrAKNLIt+QbKreLX6tcRNFi3plTxoT70eDDDfb8YWRjiX7w
 33CiwDFPM95SkQ2YI+Gb1inIQaiRWW4rrA0O2AuE/0XsQvdaPkpYU0YD7U1eVIUvWA+e
 EKspCn09i28DPdRhfIXtztZA44Wvpd37zfBGtmjiD5684wOmVoYzL+5alPS7wWRkownS
 rwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RA+iQWQTeYlsLY2I1OK863JprrWYyeqL7Fz/PQqMnUA=;
 b=KdTsnRUSxkmEuRcHNYMTYU9orHTo//PHcaOSr+cFgqT+p5IfBnYIoEnzxZU/X+u4oO
 rHspAKr8ODCdS9+vFhzmeZb3LaVJwueSY7ozyG7Z1tF8FaCI4/F5raml4qZHddEIkZPV
 gc4x9vUuJQtYDPSvtXMDFJ9X3mLKyGqWqnDO0h+3+jONQE2gWsmpqHJbcdoSccFJsia2
 t2aRInWP5w66fWMDeBQOTCYylbPQX0vAG7NS/wKpFoBGL5LeGMPuwKOR2B3DAH5ZooK8
 rYdWp7OpAVIqcpW377bkXe7xeEnxoLthaNFiqy/e7EVXhc5aFJrb94ftcePArO81B4k1
 SX4A==
X-Gm-Message-State: AOAM530QLz9I8yPIF8cARK2TQYpIwUoZLgACNB5pbsijdNFfLr8zzH7z
 XzRoyGT9Z7J7Q2+lLbJ6Les=
X-Google-Smtp-Source: ABdhPJwOgUdAbv2xPdPo89MY8rKRJHap2afTvPSwUStzaGBu0/3szRY/7SWM8uiNTPJYMPh9XY/B8A==
X-Received: by 2002:a17:906:404:: with SMTP id
 d4mr21836488eja.449.1628015014978; 
 Tue, 03 Aug 2021 11:23:34 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id b13sm8575284ede.49.2021.08.03.11.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 11:23:34 -0700 (PDT)
Date: Tue, 3 Aug 2021 21:23:33 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Woudstra <ericwouds@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: dsa: mt7530: always install FDB
 entries with IVL and FID 1
Message-ID: <20210803182333.s2oc4yizwrzy746i@skbuf>
References: <20210803160405.3025624-1-dqfext@gmail.com>
 <20210803160405.3025624-5-dqfext@gmail.com>
 <20210803165138.3obbvtjj2xn6j2n5@skbuf>
 <20210803175354.3026608-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803175354.3026608-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_112337_918761_AD71C127 
X-CRM114-Status: GOOD (  14.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 04, 2021 at 01:53:54AM +0800, DENG Qingfang wrote:
> On Tue, Aug 03, 2021 at 07:51:38PM +0300, Vladimir Oltean wrote:
> > 
> > The way FDB entries are installed now makes a lot more intuitive sense.
> 
> Did you forget to add the Reviewed-by tag?

Yeah, in fact I did. I was in a rush and by the time I figured that
I didn't do that, I had already left home.

Still, in fact the patch is obviously correct, which is nice. Standalone
ports never learn and the FDB lookup will always miss because it's in
FID 0 (a separate FID compared to the bridge ports) and there is no FDB
entry there. Packets will always be flooded to their only possible
destination, the CPU port. Ports under VLAN-unaware bridges always use
IVL and learn using the pvid, which is zero, and which happily coincides
with the VID which the bridge uses to install VLAN-unaware FDB entries.
Ports under VLAN-aware bridges again use IVL but the VID is taken from
the packet not just from the pvid, so the VID will be >= 1 there. Again
it coincides with the vid that the bridge uses to offload FDB entries.
Nice, I really like it, it is really simple.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
