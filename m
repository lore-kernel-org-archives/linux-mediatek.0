Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A798AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BZHHV2L5+5VPEO6p1zm3nbeqyQ5wTAWynQpRMY9qig=; b=UPnnUDvS6VQo8M
	l5CEV+iztasW6n/hpHxVpM2Tdq0//aXgb6nhipjxnBLQgzLQAiThrnvtIvgoKDluSNtA1z3/hyD0d
	bZvAdtasuuSR/ADKgk+oChtEsyfPKGRgItnZoyc9lCeiEkztJB8BdsGWkWzRGPKOONCIh0pqQYaFV
	vHMg5wCO5XgLI2h6K8hCvrUVsCPmvaEOo0TgK1q+27dcpDF6/JmbtxyZWMTAPWFDbAwi7aCANJfjH
	0Qhl9sEHneUxcBUMNKc4p4QLtDJVIDEw6gESe6oziTfZsWgRbJhRMvNQYlRjxDvquUMJ5WBeddCZk
	4Xb+fzwRhynFA1gXvaqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCMdA-0085CM-Cx; Tue, 25 Jan 2022 14:17:08 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCMd7-0085Bf-Rt
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 14:17:07 +0000
Received: by mail-qv1-xf29.google.com with SMTP id a7so25189343qvl.1
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Jan 2022 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hcwrY98PeaNjLrLBVr1+i4LjDqsWDo4k0IbHruqFyc0=;
 b=CoRqXYU89a2tD0HilRDXsf3ao2j3UrxRd0eGwsVuE6RXaKI1Xl+q/WK2cfLiV2kuHJ
 M5On0lkWIRTHuOxSHwfIlzQyTTUDB8h5BOnE59gLXAqJQHEXGGILpI1zBLroXZU43jol
 zT0QKubLS3IPcfTGoKKFi6PYj4gKEa5KjoqNFSCwYoNrL2rXwkS2wfNPrKSrykkR8MaO
 rdohEsrRanZUzguLIKii9g5Xkh822RTboAnQ7pcoqffIt7NY/NeFEJ5Fii4wtX6cpAsr
 XiyvPLtI/8aA3kb9cfSWMuA7WEQQP4LzF+FaJr/lbrLa4hKaYPKQ1KMXWE96z92Q0KI6
 hUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hcwrY98PeaNjLrLBVr1+i4LjDqsWDo4k0IbHruqFyc0=;
 b=EqOC3iy+dgC/pDZObWa0RTsYgS0C7KdCaDY1RV+Zp6aHcFUA+lBPYSElGgxt5C+4ws
 sqRXASsDM1yXu4CKCVF4V0D9+H5hdaIhgRkANDqgYXWxfPy1N7m9cjXt5zT2CwPnQOvP
 elBV0vZtK/qNv/obqMWlzQz/jPjdWvglxFgZR7ixCg559a8RZNqs813q1UieQJITgK9W
 KiHMTPerfeGmPDvR/Oz2F3i5Toh5lBIkL1EXpcGTAupNKtHL5/ljxBkhYEqRnUoLkKV9
 Mn8qUxZACxXRGQvBVpT10FBmHHzoevjKOkimkM3QmvMZ+dsgzzMY9YqFfq8e28y4a1Js
 P6QQ==
X-Gm-Message-State: AOAM533fJ4aztbEbkI9WgxPi5xlvCh3JJSWPAMQmETFg+oKkdDCrFsLE
 Xm3UUylboyC9PSnFiE6if0lvSt5on53yxQJPHsrZSw==
X-Google-Smtp-Source: ABdhPJwB/Yz/dvSFqh8Csk93geedfR/oi+I8iXdNHEmIRWDzYS7BkYHepDA2DJ8o9bJmXZ0v0OIxQiawf/n1sWOfM6k=
X-Received: by 2002:ad4:5aa2:: with SMTP id u2mr8745370qvg.42.1643120222389;
 Tue, 25 Jan 2022 06:17:02 -0800 (PST)
MIME-Version: 1.0
References: <d291f592-d84a-2ffe-7f75-df77890efce8@gonehiking.org>
 <20220120095622.1938-1-mike@fireburn.co.uk>
In-Reply-To: <20220120095622.1938-1-mike@fireburn.co.uk>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Tue, 25 Jan 2022 14:16:51 +0000
Message-ID: <CAHbf0-HLCcgZfbKdWQ-kX+QbRGJsEHCEDnG=NZ5QF71aTeDMGg@mail.gmail.com>
Subject: Re: [PATCH] mt76: mt7921e: fix possible probe failure after reboot
To: khalid@gonehiking.org
Cc: Deren.Wu@mediatek.com, Eddie.Chen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Eric.Liang@mediatek.com, Leon.Yen@mediatek.com, Mark-YW.Chen@mediatek.com, 
 Soul.Huang@mediatek.com, Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, 
 YN.Chen@mediatek.com, abhishekpandit@google.com, ch.yeh@mediatek.com, 
 frankgor@google.com, jemele@google.com, jenhao.yang@mediatek.com, 
 jsiuda@google.com, km.lin@mediatek.com, linux-mediatek@lists.infradead.org, 
 linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com, nbd@nbd.name, 
 posh.sun@mediatek.com, robin.chiu@mediatek.com, sean.wang@mediatek.com, 
 shawnku@google.com, steve.lee@mediatek.com, ted.huang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_061705_930880_9FBD6FB4 
X-CRM114-Status: GOOD (  12.80  )
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

On Thu, 20 Jan 2022 at 09:56, Mike Lothian <mike@fireburn.co.uk> wrote:
>
> Hi
>
> I get a BUG and the kernel resuses to boot with this patch when mt76 is compiled into the kernel
>
> https://bugzilla.kernel.org/show_bug.cgi?id=214557
>
> I don't see this issue when mt76 is compiled as a module
>
> My .config is at https://github.com/FireBurn/KernelStuff/blob/master/dot_config_tip
>
> Let me know if you'd like any more info
>
> Cheers
>
> Mike

The bug I was hitting was due to a different change introduced in rc1,
with that reverted your patches work great

Though I am seeing lots of these messages from the bluetooth device:

Bluetooth: hci0: unexpected event 0xff length: 5 > 0

I'll bisect that next

Thanks

Mike

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
