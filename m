Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B79CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWF/D2LAJjRImrYv8vlBa8sSG/gkjzq9eAmu3m3Bejw=; b=Ja3u3RKa/uyxyU
	0WIsyq5LA9uXXKH13YFauOCR0W7EhvDtEJ20HXNWFwtuFpfE5CJhG3eUR5lEtjKIBg3piuoVqIpZc
	cOnsvqxCePRZH3nO9Vp5LX8mapgGI2rkwbSfWrTJEXwEePgipSwCSobWmslJ9IdDuthyNTlPwJUoG
	VDHRMp+D6eDyVZeGgnfB+SZg99nwcQ/psA+oGZkp6IZl0EOg+uWO9uvdJjjYji8FNhaSzyxfEA6YI
	ZvarNY63RaBXRuVsHJXpSJD9wEy6D8T1OGQPY3PrDi3WkfEqiqXfu6WdxR3aw5aXuHpKNT6qqt5MC
	Zf08I3lJY7dFp+PFjOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNHOV-001e65-VX; Thu, 24 Feb 2022 16:55:07 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNHOS-001e4Y-UO
 for linux-mediatek@lists.infradead.org; Thu, 24 Feb 2022 16:55:06 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id w7so4677034qvr.3
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Feb 2022 08:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DXPNnlAjhOiDJLg5gbjFBgF6ssyzfnV2Q6Fjv6GQF4I=;
 b=FFhunHPCX/w1efnWA6Xn0Ym4Wu8MZm/FdB0T6fyxQsqryu1NePmOzHoskTl3v6uk+W
 aFkytUzNkY3JeUWoU/U3nU9QO7aXc4qQjQVYcpqegPqwmXmog8HLQJirw4EizcKofdsv
 nVS1Do9o4jArL5QzyfeEbipscmSr2/ed/lzw+qes90qLHLO7FJirTTCNAOybRsJSTc6M
 NajOSu7gBx5D3FIpbs0AOdlBSgPZpRFXK3EZw/YPxEDcbqnaYNbx6YexBS3wJktZEF9a
 QHcc5xpmr6fGwlSlrCEd9LCTaRUUQv0d0moX04Qme5asZkMGGrqOagEcZtqTUwzJvcXd
 za/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXPNnlAjhOiDJLg5gbjFBgF6ssyzfnV2Q6Fjv6GQF4I=;
 b=WlGmVZF3FSc9Xi2iew+Vi6fw6hx5/D5ALSpEUCbYkTukf4PYAdg3MzuiHZE3/jYBMZ
 Bs4Q/M+a29D3QjfpCHB9JswKBLRVPTVBjITeFg10iqoI2SeBfpgNWQs3mV32197O2ewM
 RkKM5LeBIFE902XJig++xFRSd7OMMkwykBMzo2q+W9BFFY+SQb04t84KjnfZ7VQA80Y5
 oZ3ZrELsd72m0kGTPYijRKW8c1+MBdKvAaE1SwiczQ4D4BLeecNgfOyn+sykPLUQr+G+
 VeKqV/RZ3tTPUioydTZl5GjaTtI/gDVO5seHktxaxuPqAScWuSWECAw5mWOODWBukV0u
 nB1Q==
X-Gm-Message-State: AOAM532WbBI2EUc8rI3Bl7G3m8KbH1c2THWBHUBERZfOjU7kKjuhkkYR
 CeBHrbbgwxj9161gmdtbXKFNR8bBf2BTgMYG6MKdnA==
X-Google-Smtp-Source: ABdhPJxJQqF2+HRYwSLNa/lBytL/zXGwgoRRaxkZ7CaYqfS5JtatQ3Woh9tqksMdrNZCkLQl2GTJBf4gfdp9YQvzxho=
X-Received: by 2002:a0c:a994:0:b0:432:9b1b:f815 with SMTP id
 a20-20020a0ca994000000b004329b1bf815mr2135081qvb.42.1645721702203; Thu, 24
 Feb 2022 08:55:02 -0800 (PST)
MIME-Version: 1.0
References: <d291f592-d84a-2ffe-7f75-df77890efce8@gonehiking.org>
 <20220120095622.1938-1-mike@fireburn.co.uk>
 <CAHbf0-HLCcgZfbKdWQ-kX+QbRGJsEHCEDnG=NZ5QF71aTeDMGg@mail.gmail.com>
 <9d692dc9-4b24-44b0-cbe0-dfc33f3d5f03@candelatech.com>
 <CAHbf0-FwH-ftCFeqrNusu4DBPrKe0SeTAQnAZngpsn+At-fJsQ@mail.gmail.com>
In-Reply-To: <CAHbf0-FwH-ftCFeqrNusu4DBPrKe0SeTAQnAZngpsn+At-fJsQ@mail.gmail.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Thu, 24 Feb 2022 16:54:51 +0000
Message-ID: <CAHbf0-E6TOfwNOVWDxgaU4D4D1dFPwHK8h_k5AfuxJkaQvDcVg@mail.gmail.com>
Subject: Re: [PATCH] mt76: mt7921e: fix possible probe failure after reboot
To: Ben Greear <greearb@candelatech.com>
Cc: khalid@gonehiking.org, Deren.Wu@mediatek.com, Eddie.Chen@mediatek.com, 
 Eric-SY.Chang@mediatek.com, Eric.Liang@mediatek.com, Leon.Yen@mediatek.com, 
 Mark-YW.Chen@mediatek.com, Soul.Huang@mediatek.com, Stella.Chang@mediatek.com, 
 Tom.Chou@mediatek.com, YN.Chen@mediatek.com, abhishekpandit@google.com, 
 ch.yeh@mediatek.com, frankgor@google.com, jemele@google.com, 
 jenhao.yang@mediatek.com, jsiuda@google.com, km.lin@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 lorenzo.bianconi@redhat.com, nbd@nbd.name, posh.sun@mediatek.com, 
 robin.chiu@mediatek.com, sean.wang@mediatek.com, shawnku@google.com, 
 steve.lee@mediatek.com, ted.huang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_085505_083039_0CAADF44 
X-CRM114-Status: GOOD (  20.47  )
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

Hi

Has this patch made it into any upstream trees and is it likely to be
backported?

Cheers

Mike

On Tue, 25 Jan 2022 at 22:56, Mike Lothian <mike@fireburn.co.uk> wrote:
>
> On Tue, 25 Jan 2022 at 18:09, Ben Greear <greearb@candelatech.com> wrote:
> >
> > On 1/25/22 6:16 AM, Mike Lothian wrote:
> > > On Thu, 20 Jan 2022 at 09:56, Mike Lothian <mike@fireburn.co.uk> wrote:
> > >>
> > >> Hi
> > >>
> > >> I get a BUG and the kernel resuses to boot with this patch when mt76 is compiled into the kernel
> > >>
> > >> https://bugzilla.kernel.org/show_bug.cgi?id=214557
> > >>
> > >> I don't see this issue when mt76 is compiled as a module
> > >>
> > >> My .config is at https://github.com/FireBurn/KernelStuff/blob/master/dot_config_tip
> > >>
> > >> Let me know if you'd like any more info
> > >>
> > >> Cheers
> > >>
> > >> Mike
> > >
> > > The bug I was hitting was due to a different change introduced in rc1,
> > > with that reverted your patches work great
> >
> > What patch did you revert?
> >
> > Thanks,
> > Ben
> >
>
> Hi
>
> I reverted both 730b49aac426e1e8016d3c2dd6b407e500423821 and
> 510a0bdb2bfcff8d7be822c72adc3add7a97d559
>
> But there's a fix now,
> https://patchwork.kernel.org/project/linux-usb/patch/20220124090228.41396-2-heikki.krogerus@linux.intel.com/
>
> I'm able to load mt76 as a module or built in
>
> Cheers
>
> Mike

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
