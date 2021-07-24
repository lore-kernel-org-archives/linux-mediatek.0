Return-Path: <SRS0=BtH1=MQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5C9C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 21:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6354A60E90
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 21:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6354A60E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqIc93lMxZ5fX1uml2rHD/SyStIKoVzlkcyZc0z8hqI=; b=wCe0h3FQQ9XSnE
	oxa9x4SS72vTHMwuagxSnJhojh5YRIajfynTZWGpjtky2jZ7p8upZA8RBs0UyJAGieEmJO0+e3qyg
	+9ZnypBtFLFQSgm5oCRpD0j+oH1QaURNMiB9zQPX01YPZOTXf40bmP1N8C+0h2pwXmxihLwLohbDy
	gvsmGRoV3OtJetR507tEKkGFeZs4KcyGVW4oKelApX+unZCY4kDg2y8aqc8MPKSWQ02Dzctvej8Bg
	2neP6YYACS7AFQ8qIFp/Bmvw4mAfq25zJyIJo6xxdArDdrfNWKo2ze+tQ1XGuozxkvpnGdBn9j84m
	GUOAicZii8ReWKucylhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7PQE-007qzP-FU; Sat, 24 Jul 2021 21:43:02 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7PQB-007qyk-7a; Sat, 24 Jul 2021 21:43:00 +0000
Received: by mail-qv1-xf31.google.com with SMTP id f91so727484qva.9;
 Sat, 24 Jul 2021 14:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Xubroawzwj5b5qwwsClOnfd6twbJAitiIsQAo4rrsQ=;
 b=QgD3WnqbVmU3Mr8Ylc/G0vDxkmiy2A94zG94MoBLgx1F3HocbImPbitOKNnBo9QOFk
 lAdZuS+nhp2nz0QwaLPAC6O5FGkAP2mC1oBR85sKVoDyrxx9M8yQl2DMDHVjzrlOIEmo
 0KLqsEy9AeYcw1VNv+DERNjp29mybxP+8ZNT/7QLhVZJmEgq0ZdL5Nct0B+hpAfMYDVN
 wqxgut7Qb+gConRtsGDEmlSVkcwAyZE1V1CNphwxdEnpmPwDlAFOewE7c8Fbbr53BG5b
 OUaQ2TY2tA26Qg/uWofLMpw5ILblzF3hgskxi8HTbfIJqckk+05/VaJNAYSnV8fzvjSt
 9GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Xubroawzwj5b5qwwsClOnfd6twbJAitiIsQAo4rrsQ=;
 b=XDVp3AwkXuwQQwRg8oKQMbFYD+7TGDid8aPy97EInLtkY5Pdf9rVNAKviCGeae0aH8
 ND/Il+js7dPtSyTcqgTDW1p1rT25LkXF6axYG9aaVxUrq50WYUCEoln6G/c/1UVSb+s2
 jCsVld4HLp3mygVjGKX5CsxzWAHAs25LyyKeBSgwPtSHcdGyjSu9IIkAeis5Zqp2RL0w
 q2yLiWh3/eFoIMj/vMQm3RG5OLO+uZQGaF7yrGEZRNPejeu+Nl4/sKO/TCM5r3Z5PtXJ
 vO4eexf0EpAwQ5GJfAXmRx4aOKCZ5QA4bbEonbgjf7YsPJbXzms4L5rK+UD1/msx1gY3
 0djQ==
X-Gm-Message-State: AOAM533WV6DQz4mWEJCj97n4ConYhUAc6b9ARNl3KFSrZ7WT99wMq0uJ
 tSft1cLXwRR0ZWcio73bL/0Sdbe2HkIkxQziAe0=
X-Google-Smtp-Source: ABdhPJzMkwWaAEWUP64MJj/kC4FFv+hFSt1ASdvUpOEersKGdA9TvyW5c+cG79/4TUOzRaguIJnexg77HP4TO27zto0=
X-Received: by 2002:ad4:5ccc:: with SMTP id iu12mr11189760qvb.21.1627162977350; 
 Sat, 24 Jul 2021 14:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
 <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
 <CAEsQvcu3jXa4fXJAu7nvT+G+-S2bZ1BPkcuwnT4VjbrnW1Pkog@mail.gmail.com>
In-Reply-To: <CAEsQvcu3jXa4fXJAu7nvT+G+-S2bZ1BPkcuwnT4VjbrnW1Pkog@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 24 Jul 2021 18:42:49 +0000
Message-ID: <CAEsQvcuHyaWQQKYqydgv-XhFo7byaARYFGrPmpCu8XSRgTPDTg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: Takashi Iwai <tiwai@suse.de>
Cc: chihhao.chen@mediatek.com, alsa-devel@alsa-project.org, 
 wsd_upstream@mediatek.com, damien@zamaudio.com, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_144259_343270_73933ECE 
X-CRM114-Status: GOOD (  23.79  )
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

I tried to convey in code what I had in mind.

It's a rough sketch and very much untested.

--- clock.5.14-rc2.c    2021-07-24 18:30:09.773718208 -0000
+++ clock-one-to-one.c  2021-07-24 18:35:52.276412366 -0000
@@ -54,6 +54,61 @@ static void *find_uac_clock_desc(struct
        return NULL;
 }

+/* Behringer UFX1604 / UFX1204 have a simple one-to-one
+ * topology where there is only one Clock Selector, only
+ * one Clock Source linked to USB SOF and no Clock Multipliers.
+ *
+ * This function checks for the presence of such a
+ * one-to-one clock selector / clock source topology
+ * so that it's possible to safely set the one and only
+ * Clock Selector to the one and only Clock Source
+ * upon sample rate change without breaking devices
+ * with more complicated topologies.
+ */
+
+static bool one_to_one_clock_topology(struct usb_host_interface
*iface, int proto)
+{
+        int clock_sources, clock_selectors, clock_multipliers = 0;
+       int source_version, selector_version, multiplier_version;
+       int found_count;
+
+       void *cs = NULL;
+
+       if (proto == UAC_VERSION_3) {
+               source_version = UAC3_CLOCK_SOURCE;
+               selector_version = UAC3_CLOCK_SELECTOR;
+               multiplier_version = UAC3_CLOCK_MULTIPLIER;
+       }
+
+       else {
+               source_version = UAC2_CLOCK_SOURCE;
+               selector_version = UAC2_CLOCK_SELECTOR;
+               multiplier_version = UAC2_CLOCK_MULTIPLIER;
+       }
+
+        if ((found_count = snd_usb_count_csint_desc(iface->extra,
iface->extralen,
+                                             cs, source_version)) > 0) {
+               clock_sources = found_count;
+        }
+
+        if ((found_count = snd_usb_count_csint_desc(iface->extra,
iface->extralen,
+                                             cs, selector_version)) > 0) {
+               clock_selectors = found_count;
+        }
+
+        if ((found_count = snd_usb_count_csint_desc(iface->extra,
iface->extralen,
+                                             cs, multiplier_version)) > 0) {
+               clock_multipliers = found_count;
+        }
+
+       if ((clock_sources == 1) && (clock_selectors == 1) &&
(clock_multipliers == 0)) {
+               return true;
+       }
+
+       return false;
+}
+
+
 static bool validate_clock_source(void *p, int id, int proto)
 {
        union uac23_clock_source_desc *cs = p;
@@ -323,7 +378,7 @@ static int __uac_clock_find_source(struc
                ret = __uac_clock_find_source(chip, fmt,
                                              sources[ret - 1],
                                              visited, validate);
-               if (ret > 0) {
+               if (ret > 0 &&
one_to_one_clock_topology(chip->ctrl_intf, proto)) {
                        err = uac_clock_selector_set_val(chip, entity_id, cur);
                        if (err < 0)
                                return err;



--- helper.5.14-rc2.c   2021-07-24 18:30:25.042526253 -0000
+++ helper-one-to-one.c 2021-07-24 18:35:45.019503597 -0000
@@ -64,6 +64,29 @@ void *snd_usb_find_csint_desc(void *buff
 }

 /*
+ * find every class-specified interface descriptor with the given subtype
+ * and return how many did it find
+ */
+int snd_usb_count_csint_desc(void *buffer, int buflen, void *after,
u8 dsubtype)
+{
+       int count = 0;
+        unsigned char *p = after;
+
+        while ((p = snd_usb_find_desc(buffer, buflen, p,
+                                      USB_DT_CS_INTERFACE)) != NULL) {
+                if (p[0] >= 3 && p[2] == dsubtype)
+                        count++;
+        }
+
+       if (count > 0) {
+               return count;
+       }
+
+        return 0;
+}
+
+
+/*
  * Wrapper for usb_control_msg().
  * Allocates a temp buffer to prevent dmaing from/to the stack.
  */



--- helper.5.14-rc2.h   2021-07-24 18:30:35.219398312 -0000
+++ helper-one-to-one.h 2021-07-24 18:29:34.139166195 -0000
@@ -7,6 +7,8 @@ unsigned int snd_usb_combine_bytes(unsig
 void *snd_usb_find_desc(void *descstart, int desclen, void *after, u8 dtype);
 void *snd_usb_find_csint_desc(void *descstart, int desclen, void
*after, u8 dsubtype);

+int snd_usb_count_csint_desc(void *descstart, int desclen, void
*after, u8 dsubtype);
+
 int snd_usb_ctl_msg(struct usb_device *dev, unsigned int pipe,
                    __u8 request, __u8 requesttype, __u16 value, __u16 index,
                    void *data, __u16 size);

On Sat, Jul 24, 2021 at 3:20 PM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> > Dr. Iwai, perhaps we could restrict the generalized fix for the
> > Behringer UFX1604 / UFX1204 with some simple logic to devices that
> > only have *one* clock source.
>
> Okay, rereading the original commit log from Cihhao Chen I gather
> Samsung USBC Headset (AKG) with VID/PID (0x04e8/0xa051) actually has
> two clock selectors and only one clock source.
>
> Correct me if I'm wrong.
>
> This is complicated by the fact I haven't been able to find a lsusb -v
> of Samsung USBC Headset (AKG) with VID/PID (0x04e8/0xa051)
>
> Even so, my proposition still stands: devices with only one clock
> source and only one clock selector should be able to handle us
> selecting the clock selector to the only clock source.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
