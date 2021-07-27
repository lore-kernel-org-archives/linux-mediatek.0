Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C741FC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 20:57:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E2360F6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 20:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85E2360F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFIUegi9onhqZNe4v6bThM5yr8lD5MUGIJAejfWt5Ig=; b=fr+bfyXZeHK/Kj
	wSrxYAhTWookFswuxIx3tdVpcn+YH1JoHY49GicWkwu7HGM6k8a1qKRDWdR9/Noj058MfvQVqH4Fh
	U2AMTQSH9Z4k3Wa79b6J/OaBfAU7LQeYjWCay9H/qSsZ/Vo4EAzuMpukNXygAx+VB6ACjrtUW9VOe
	Aby4y8FFtoqVk3RO6ZK4iSxOLoCsCl53xfJ0pCfWgEM4wbpFygYHnl0cZUXO7IkccO3grL5qby63Z
	Wa92qlq01SqtJqCMpUy37sdT2ULeH2dmXSDCyl/7OWvHfMGR2pdKYZ8UctlUagSBiqfEhWSUcEYJ7
	RvNezCJaeVNWHPS+cOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8U8l-00GJJD-1P; Tue, 27 Jul 2021 20:57:27 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8U83-00GItP-HA; Tue, 27 Jul 2021 20:56:45 +0000
Received: by mail-qk1-x733.google.com with SMTP id t68so111122qkf.8;
 Tue, 27 Jul 2021 13:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5//oOHuSPsYAOusVOhmt6ZgP2slz+I2zua77g1mYYaA=;
 b=SUbPn6lwVRpg1qvmx2Gz6SGev667SkmIlLC/m7IhRKiH13GNsAYsP6ceNmlSECoogo
 nkUxieCmaA6gHCBrORehT7/zuQDVdvcxyM5CAUWDRDRn/2PE6uir8Ri9Z89RCmfsVWCT
 aPxawqBaLqgfs43o4nVcV+RI8II0loe3NcE7JeSmTdyQA6FzkgytjyOr5Df3/Jd7IpTy
 CrMBrXo8up0luhc2QJH74bL1KMWojl9pnq/3IPjCiMZvAh2eC4QwAi+8Roa1GgrPoAVG
 kvfaqUEutJ87vTsLV5o9SrsihgvRXZkTRPQisvdm6liznJ5jrMuL22lO2hIEYgHbOzVA
 CLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5//oOHuSPsYAOusVOhmt6ZgP2slz+I2zua77g1mYYaA=;
 b=QCmcZ8VVwwecoBAzQTBdxzt843Im8sotUc+mh9yh04mzvjTbi6sL7vfCQRjuKkgUUT
 5bnqGQ1liaBLh80c6gJ/+gQGXW29wCH/Simn9Klw6P9LX7DqjbPoF8vLLAaHtvVDtJoV
 FJnDw1hOKLkvE+fqwh1wil2lHRQaEYOe2SHP7z3qhVMedb+EPLwkCp+BTAgxcOOoG/1t
 n/HUbkbULiwABtNLM0FNtitTp/njt8yHcyTUuujQJYa6fkTCmu2TskGm3PzmxyTY63xD
 uFOtPVjnY5Ohxgyvnk9ayllt83NJexA78HNFONhLAemXaXYMav5upwBfmlPEtxCE+HN9
 mF2w==
X-Gm-Message-State: AOAM531pmbH0QVVC/fsTB/RrAFeLToKC9XkgjsSHhVAHKeP97P68Ztlw
 L+vTr/GqphRy1VoNSbyDTMT0iD/rUqGV/H7huPs=
X-Google-Smtp-Source: ABdhPJz7USORpL2+8VeyVekCt4fwAiubyQ7qL3dJ1KSS2Qo5gpjZOC1Sc8LR8htHJIar5jyg7NMKFHtV5DGPf2kytGM=
X-Received: by 2002:a37:e44:: with SMTP id 65mr23697309qko.193.1627419401647; 
 Tue, 27 Jul 2021 13:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
 <20210727102744.30364-1-chihhao.chen@mediatek.com>
In-Reply-To: <20210727102744.30364-1-chihhao.chen@mediatek.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Tue, 27 Jul 2021 17:56:33 +0000
Message-ID: <CAEsQvcuOQ_Tg0bRbsegECdBUsGxa61ei9-Z2bRbGvQ9FmEUPbA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: chihhao chen <chihhao.chen@mediatek.com>
Cc: alsa-devel@alsa-project.org, damien@zamaudio.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, tiwai@suse.com, 
 Takashi Iwai <tiwai@suse.de>, wsd_upstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_135643_674147_FF6E4468 
X-CRM114-Status: GOOD (  16.54  )
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

On Tue, Jul 27, 2021 at 10:28 AM <chihhao.chen@mediatek.com> wrote:
>
> From: chihhao chen <chihhao.chen@mediatek.com>
>
> Hello
>
> <6>[  150.347456][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
> <6>[  150.347517][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.384289][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
> <6>[  150.390920][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.438156][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
> <6>[  150.438226][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.473547][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
> <6>[  150.480165][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.513375][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.513439][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.546161][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.552678][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.584347][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.584418][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.617760][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.624253][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.657906][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.657982][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
> <6>[  150.689571][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
> <6>[  150.696109][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
>
> Chihhao
>

Thank you. Chihhao Chen!

I see both EPs have their Clock Selectors (ID 0xC for EP 81 and ID 0xB
for EP 1) selected to pin 2, i.e. Clock Source ID 0xA.

I'm assuming this log is for the vanilla kernel without Chihhao's fix.
Please correct me if I'm wrong, Chihhao.

From the original commit message for the fix, we know the correct
setting for Clock Selector 0xB should be pin 1, with Clock Source ID
0x9.


Takashi Iwai already shared his perspective that this is a firmware
bug on the device.

I have a hunch that the firmware bug is setting both Clock Selectors
at the same time regardless of which one we want to select
specifically.


Chihhao, please try the below patch and perform another echo test.

Let us know if the echo test works or if it still fails and please
remember to share with us the relevant dmesg logs.


Thank you,
Geraldo Nascimento


--- clock.c.orig        2021-07-17 12:15:06.416028360 -0000
+++ clock.c     2021-07-27 17:36:16.954774954 -0000
@@ -324,9 +324,45 @@ static int __uac_clock_find_source(struc
                                              sources[ret - 1],
                                              visited, validate);
                if (ret > 0) {
-                       err = uac_clock_selector_set_val(chip, entity_id, cur);
-                       if (err < 0)
-                               return err;
+                       if (chip->usb_id == USB_ID(0x04e8, 0xa051)) {
+                               if (entity_id == 0xc) {
+                                       err =
uac_clock_selector_set_val(chip, entity_id, 2);
+                                       if (err < 0)
+                                               return err;
+
+                                       err =
uac_clock_selector_get_val(chip, 0xc);
+                                       if (err > 0) {
+                                               printk(KERN_ERR
"__uac_clock_find_source: Clock Selector 0xc has pin %d selected",
err);
+                                       }
+
+                                       err =
uac_clock_selector_get_val(chip, 0xb);
+                                       if (err > 0) {
+                                               printk(KERN_ERR
"__uac_clock_find_source: Clock Selector 0xb has pin %d selected",
err);
+                                       }
+                               }
+
+                               else if (entity_id == 0xb) {
+                                       err =
uac_clock_selector_set_val(chip, entity_id, 1);
+                                       if (err < 0)
+                                               return err;
+
+                                       err =
uac_clock_selector_get_val(chip, 0xc);
+                                       if (err > 0) {
+                                               printk(KERN_ERR
"__uac_clock_find_source: Clock Selector 0xc has pin %d selected",
err);
+                                       }
+
+                                       err =
uac_clock_selector_get_val(chip, 0xb);
+                                       if (err > 0) {
+                                               printk(KERN_ERR
"__uac_clock_find_source: Clock Selector 0xb has pin %d selected",
err);
+                                       }
+                               }
+                       }
+
+                       else {
+                               err = uac_clock_selector_set_val(chip,
entity_id, cur);
+                               if (err < 0)
+                                       return err;
+                       }
                }

                if (!validate || ret > 0 || !chip->autoclock)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
