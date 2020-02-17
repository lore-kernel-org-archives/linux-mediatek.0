Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EECEC33FA0
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 13:23:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8E362072C
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 13:23:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OIE4RQQs";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="MJHZiTxG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8E362072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ikk8VWahopnv6IBPQhDEX1yJrYsdwmkU8KV1otxmmTY=; b=OIE4RQQsJC8DHA7OnVd5qkDcf
	4oL+JA5a6ALiB14CCY7eu54d6kXB6RyuEQ8ELfEmAh8hW1DvbolVnhufBmffYkCoP1Lw7JbC6OlpX
	mrWK3meZ2TsHNwU7wqT1IXmG3o3sZo6cABI9PSsXPzU0JzLgnhW1YVEX4udI0dKIlzgnHg7Poti3R
	4ua2QQERvvSDR1/nc65RVRAy+h+IG9E3pT65CJ9nnQgIlsu5+du6rMEyowS7Ujjzbw/npiVP+jCIl
	5E8XRQtzQRGqbUeh9zpPpVJJDn4MeJVOdzp7e5liIz7iJmgkANh9YNKR9hHvZsbeJ5iUYaoNByxgp
	8noPbXGRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3gMZ-0002U9-7z; Mon, 17 Feb 2020 13:23:03 +0000
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3gMU-0002SX-Cj
 for linux-mediatek@lists.infradead.org; Mon, 17 Feb 2020 13:23:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1581945779; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zYaEbtFkXfhmP+oRysQ8QVN5kHY6AaSc1zt8CAGAK7k=;
 b=MJHZiTxG5bfz6iq3MJlnKuPNHZpCoRZnxIPYfaDKTA9w9Ld78I11m1i63dMX94pL39/hZKEV
 yrtbYhkwcpD+gBGtuZaqAF/OxQWXOiezwfHHClZiFqFiSELdk5n72e/kgObf+lW0PbOFwekg
 FtO95+jmqbju0pEisp9GwSBkxdc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a93aa.7f7ab6024228-smtp-out-n02;
 Mon, 17 Feb 2020 13:22:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E702DC447A0; Mon, 17 Feb 2020 13:22:49 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 512E8C4479D;
 Mon, 17 Feb 2020 13:22:49 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 17 Feb 2020 21:22:49 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] scsi: ufs: add required delay after gating
 reference clock
In-Reply-To: <1581945168.26304.4.camel@mtksdccf07>
References: <20200217093559.16830-1-stanley.chu@mediatek.com>
 <20200217093559.16830-2-stanley.chu@mediatek.com>
 <c6874825dd60ea04ed401fbd1b5cb568@codeaurora.org>
 <1581945168.26304.4.camel@mtksdccf07>
Message-ID: <e518c4d1d94ec15e9c4c31c34a9e42d1@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_052300_128166_E49A4FB1 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 bvanassche@acm.org, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-02-17 21:12, Stanley Chu wrote:
> Hi Can,
> 
> 
>> >  			} else if (!on && clki->enabled) {
>> >  				clk_disable_unprepare(clki->clk);
>> > +				wait_us = hba->dev_info.clk_gating_wait_us;
>> > +				if (ref_clk && wait_us)
>> > +					usleep_range(wait_us, wait_us + 10);
>> 
>> Hi St,anley,
>> 
>> If wait_us is 1us, it would be inappropriate to use usleep_range() 
>> here.
>> You have checks of the delay in patch #2, but why it is not needed 
>> here?
>> 
>> Thanks,
>> Can Guo.
> 
> You are right. I could make that delay checking as common function so 
> it
> can be used here as well to cover all possible values.
> 
> Thanks for suggestion.
> Stanley

Hi Stanley,

One more thing, as in patch #2, you have already added delays in your
ufshcd_vops_setup_clocks(OFF, PRE_CHANGE) path, plus this delay here,
don't you delay for 2*bRefClkGatingWaitTime in ufshcd_setup_clocks()?
As the delay added in your vops also delays the actions of turning
off all the other clocks in ufshcd_setup_clocks(), you don't need the
delay here again, do you agree?

Thanks,
Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
