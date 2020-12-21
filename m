Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD3AC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 07:32:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4D1022BF5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 07:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4D1022BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Me3iuB2fNWia4U3tnexyjEvFeDlFkAie/2xzJPuT6yk=; b=MzcNMb2wPZBPJ8aRoAkbDMABY
	kfMkwLUaECg6oJQEnwy5OO1UYg5pMflQf7zFH5LKKJUajSfvNXSMh5l5XXzYfRBpHeFGvWHqUV4Wn
	V5/D2eOxFXahL31WFowMLDc3PRTu2vo5JfcF0YYJerXFeThE7wONATPyYVX94AV3eH8EnvGAY/sYs
	RBqBUop4WqxFsBvgRsF+CWFi+mZKyxfq0Rm8QAMudugsx64xeDcWB6BU3NOh5X3Ge5yj5XHcZbtm+
	0cwudBx9j/93sTmRcsTp4RhVCTpNsnMJmeTvHD/TxGWK4zZVgzeNOK88IKFRlrvFzelR6Yw3CuGub
	uh8UNVRGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krFg5-0002uV-Jf; Mon, 21 Dec 2020 07:32:21 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krFg2-0002u1-VY
 for linux-mediatek@lists.infradead.org; Mon, 21 Dec 2020 07:32:19 +0000
Received: by mail-il1-x136.google.com with SMTP id k8so8052369ilr.4
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Dec 2020 23:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VKKGthXLCQvXQ4nd0aqRaFO96rU0BPEkkbKVkg7CCWE=;
 b=NGd5yj17q/p9NDxBGxCPBJIPJtREvI5mLAxlhZC57Ox1yD7+Pa6DpR/H7jYFV1nHaz
 QoCUnx8BgClp+J4bSXjo+PpGrVmwJiUnE36DcEzj0bsCU3KV46yO8DwGK5YQReUe2Qfc
 L7gk4FOzdIIKxw+8/g+L0KewWlQ6Ew45WJQINMFRTaGQuAAFv1VuJ9+N11kA3PXDOp3j
 9oZXHosbPnB0RJzGwBW2rBTvaiSygZPIO514cTLKpkk+EoyciAv8X18SN5QJmgYWLMhm
 EeP+wplEwkGGjIRvDiS8mOcNICy0BctOUgjBv3E6WE6SRUh7UBlPzje6lPKvV+j6T/5w
 Cslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VKKGthXLCQvXQ4nd0aqRaFO96rU0BPEkkbKVkg7CCWE=;
 b=ZxY1O/1dBpryiLX84wB4fNUneBPSw3356zxzYoMmn3FSGZcnQaXfjPEMFa42zRyLHl
 xshNsoeNzUlp2pFUdPRZqsqhTPvRoD9Lt1lbTHLACMzCryaej6Y5Vxgxd/8rxd2YTGVE
 vrh+2kXXsl1wVSbShz5THRKgdPGwk0EIFd5etplkFpUI8cXImEXtJNBWRJ5Knum5+r8s
 oOV5MVjtBwsBcvAIybPGfz+EL8gATodPoHDb96D3hw46jkobesK8Edu/TYVOvAdgO1CC
 pFNIfAd6q3480HBG/xkPR5O41M2ZsfwB04iCUSVg6b5vOYTr6Ekjc5WTK7Tu88xiVsI1
 X6gw==
X-Gm-Message-State: AOAM532X8WIHUdbaa9Z3sW02RXKlSW8IsJvmS71h6MJLVh/aDJG0jQzr
 1n9ZasLrW6BuCzwa1PDzMhRKJLTTlazcqNSzL3c=
X-Google-Smtp-Source: ABdhPJx4keJVyXc4qHV+zlp63dRbuvDHMLpTtWIMjpMIANsDt8mwlu8WI3lqUORsVTKCSOOEjuu+0e1oforVxdtlFlI=
X-Received: by 2002:a92:dc8c:: with SMTP id c12mr15667093iln.274.1608535936833; 
 Sun, 20 Dec 2020 23:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20201219162153.23126-1-dqfext@gmail.com>
 <20201219162601.GE3008889@lunn.ch>
 <47673b0d-1da8-d93e-8b56-995a651aa7fd@gmail.com>
In-Reply-To: <47673b0d-1da8-d93e-8b56-995a651aa7fd@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 21 Dec 2020 15:32:05 +0800
Message-ID: <CAJsYDVJW+rA6N87DjBhkb_y5jJ0T7GMnUKUeBnq-uEnyYBQ3fw@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: rename MT7621 compatible
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_023219_045710_A72062F2 
X-CRM114-Status: GOOD (  17.92  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Rene van Dorst <opensource@vdorst.com>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Greg Ungerer <gerg@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

On Sun, Dec 20, 2020 at 1:10 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 12/19/2020 8:26 AM, Andrew Lunn wrote:
> >> --- a/drivers/net/dsa/mt7530.c
> >> +++ b/drivers/net/dsa/mt7530.c
> >> @@ -2688,7 +2688,7 @@ static const struct mt753x_info mt753x_table[] = {
> >>  };
> >>
> >>  static const struct of_device_id mt7530_of_match[] = {
> >> -    { .compatible = "mediatek,mt7621", .data = &mt753x_table[ID_MT7621], },
> >> +    { .compatible = "mediatek,mt7621-gsw", .data = &mt753x_table[ID_MT7621], },
> >>      { .compatible = "mediatek,mt7530", .data = &mt753x_table[ID_MT7530], },
> >>      { .compatible = "mediatek,mt7531", .data = &mt753x_table[ID_MT7531], },
> >>      { /* sentinel */ },
> >
> > This will break backwards compatibility with existing DT blobs. You
> > need to keep the old "mediatek,mt7621", but please add a comment that
> > it is deprecated.
>
> Besides, adding -gsw would make it inconsistent with the existing
> matching compatible strings. While it's not ideal to have the same
> top-level SoC compatible and having another sub-node within that SoC's
> DTS have the same compatible, given this would be break backwards
> compatibility, cannot you stay with what is defined today?

U-boot for MT7621 doesn't support device tree, and the kernel image
is always packaged with dt. Do we need to maintain backward
compatibility at all in this situation?

-- 
Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
