Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230AEC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 08:46:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D7661426
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 08:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9D7661426
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cESPYrYI2r3cxxky+1Hn2JMVXqgLptwslQAB66KckNM=; b=DVmW0KKnBD0JBewz2AIGsxJaL
	AOId27uvxaB69zlxgu2gnzjEpvKdVvnaNR1e+f8DfgVh/yC9TNVrh1XFtRiMgNjGuUmK4YgYIBVjq
	b5+e2/1Qx45oK/f0jVlcTisv/v8ggpBOHqy+rySw8zAeMnFFQfckNP75uLE2fCsu+xNyyjOgKZJsZ
	Dtx0edzTr6QsyBsjMlzD2YnC5SrkgCuZLjw3seKObmWhaSzRAaM4Isdlu3lQubpRNwaA3EBJmOYuB
	xxHpPEGP9yjq7X8JNquCwGdk20wgq1opeSZoNQ1txy3Ddk0vyrspFuFq7HmIrlIK7V6Xjs1Ui5yn1
	R3jRVpG+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZUyh-00GJ9f-Ak; Thu, 22 Apr 2021 08:46:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZUyV-00GJ7w-9m; Thu, 22 Apr 2021 08:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tTQCEcKAL48Rv+FyOthEhPeGN2Jfs8OqWMxyEZnjCHA=; b=aCLFYSWhMLcThXQCHjPrLVEkvW
 Pa07IOFH3VfNW7N20H6FgBak49KHT0LnkD6nG0tkCguT5bZBQKMmXOltYlAmYDlD/40n02JVerIlN
 Qs01v7LcW4mH6tkF5fs61K1r7jz4NPY3gT3p0wGvg1Ml8wzbeGQMJvRYFRDTwb516tkvuFyzmTGpu
 1Q+s+U2SfdTKz+MQzQ0rgXWLLZ99GVl99s+6y70/oDxmiowLjbX2McE6XnnsRJ3TmYdonYsPHEhOi
 g/VcrNumebYqgfJmzanqPyyTDiC0tnzJpXpbzHqp5X8P6jwmea67Xc09rS+mtsXEF7WPwo08wdRHV
 Aja9mwdg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZUyR-00DVxq-E1; Thu, 22 Apr 2021 08:46:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E98DD613DE;
 Thu, 22 Apr 2021 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1619081170;
 bh=4nheqwl05OYDRXeZyfMJy6aYK1NXONMSey8HL0+Zb9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PvJpDtJegEqOa0Gd7QypJCSiRy/z84tE2k+DG4b7G8Z84NqqMouJ1TDqP+F9aZdmG
 /v/G2Z6WXt5hUeHrgeqf2JyrABxWl6I5tyZ3macKHTFj2QQ14OASQliwZezOgg1arb
 s8eROn+lnAu0DHmvTih4kHCbLHHUBArZLkQzlUqo=
Date: Thu, 22 Apr 2021 10:46:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Ikjoon Jang <ikjn@chromium.org>, Yaqii Wu <Yaqii.Wu@mediatek.com>,
 linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] usb: xhci-mtk: remove unnecessary assignments in
 periodic TT scheduler
Message-ID: <YIE3z7qYNtk7G/VB@kroah.com>
References: <20210330080617.3746932-1-ikjn@chromium.org>
 <20210330160508.1.I797d214790033d0402d19ff6b47a34aff60d3062@changeid>
 <1617179455.2752.1.camel@mhfsdcap03> <YGq2YfURFApdJLxb@kroah.com>
 <1617675492.22435.4.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617675492.22435.4.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_014611_524872_FF9B0E83 
X-CRM114-Status: GOOD (  11.34  )
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

On Tue, Apr 06, 2021 at 10:18:12AM +0800, Chunfeng Yun wrote:
> On Mon, 2021-04-05 at 09:04 +0200, Greg Kroah-Hartman wrote:
> > On Wed, Mar 31, 2021 at 04:30:55PM +0800, Chunfeng Yun wrote:
> > > cc Yaqii Wu <Yaqii.Wu@mediatek.com>
> > > 
> > > I'll test it , thanks
> > 
> > Did you test this series and find any problems?  If not, I'll go queue
> > these up...
> Yes, found an issue on the start-split transaction, but not found the
> root cause yet :(

So you are objecting to these being merged at this point in time?  Can
you provide feedback to the author about what is wrong?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
