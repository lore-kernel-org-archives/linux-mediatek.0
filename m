Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BCFC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 13:34:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE7D061460
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 13:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE7D061460
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=osggNQzhBLhN2cDYLpbveFYmfmoMbJJfYxKtjUnWZLY=; b=baaHw0voJgMAUGMDcYouCX+sq
	ngPpyKslDSEsd6I9AQMcN7k7iAGkSYXThfDJTkpkpFBOyPb4jdcDVaJ+QAH2z+Ms3u6IOtGNni0CK
	N6zokcScLTnIaTDHCgtSgWvZRy3FJAGRvhjmDE8K8BsyFVEuxICJ0oh2xhhu36RRp6PlyMpHKZm9Z
	P5DWD9OnSJ1yq3NekwMA5XCG6cX7ewDzcHzSalD3Yr2LSPPBvdJiqg1HffFN0ML0BB6oJmw986wct
	8zD3eIs/yO69iAZKMHbHGfep4mhT3Ped5hLIH20Ou5M4rinVWTb1NQMAISh+74itw+RvC3O3+if1R
	bp3ADJVCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZZTW-00Gofa-C3; Thu, 22 Apr 2021 13:34:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZTI-00Goeg-Jd; Thu, 22 Apr 2021 13:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=hK1XFt3NgHfQs9u2fCr26MUE5gl79KLt2NlyA75zy9o=; b=vyIv4IbxQUEjI9MVYRnEmJPvRJ
 BcBDjC8wg2Gl7BrIdpvS6RDPJbnmrp2rnIgTz/7ZePqCz3ypIiWfxJapSq++/KHGGAVpJEKK/zub8
 QJRq3l9CIjkrMKeIZ4GhFibO/FHl88U0srQ9L/esnEl5dHmR2kjDX8rUnA21axd+4XyztEhEo5jBI
 9weO4A5B6QJxJLWAV1WCRsUqJa4nLzIIrxVMowqKqWlAp9OjSff8CzBfRaVCFVI6iw/t32AKo+2i7
 R06ougXeY+C+8PwjWoKrrCp0NpVdrwEhIv6DWGhAuPPhBHs/POW40Gma5YCqXLN5Rw/eVqUVjNNGg
 Qve7l2rw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZTE-00DifU-Om; Thu, 22 Apr 2021 13:34:18 +0000
X-UUID: 5c805e9182b4470b80f37a6f9bf4c0a2-20210422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hK1XFt3NgHfQs9u2fCr26MUE5gl79KLt2NlyA75zy9o=; 
 b=u+Yc2D0NTpSCsG0pt3OREffuUa4d8PQOXDHCf2IkoUqqheYTeJLfuZPEd3CGJm2MbzY5e6SGB4k6GSZIpexltmFFYAL7XJu/yR7qLVcr5QiIj6rLN8GOxEYurUcvVBtsQGAbsjS9saX/BFbV//wYdnnkIeu4LVdlEVRdVi81UcY=;
X-UUID: 5c805e9182b4470b80f37a6f9bf4c0a2-20210422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 524018921; Thu, 22 Apr 2021 06:34:07 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 06:34:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 21:34:04 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Apr 2021 21:34:04 +0800
Message-ID: <1619098444.4507.1.camel@mtksdaap41>
Subject: Re: [PATCH V8 1/8] PM / devfreq: Add cpu based scaling support to
 passive_governor
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
CC: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>, Sibi Sankar
 <sibis@codeaurora.org>
Date: Thu, 22 Apr 2021 21:34:04 +0800
In-Reply-To: <cfdd3973-e4a7-8c09-8a7e-57118a7a3b9b@samsung.com>
References: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <CGME20210323113411epcas1p3b4367563007ca91c30201d7fc225bb67@epcas1p3.samsung.com>
 <1616499241-4906-2-git-send-email-andrew-sh.cheng@mediatek.com>
 <233a3bd6-7ab1-5da2-9184-a745eb253d86@samsung.com>
 <1617177820.15067.1.camel@mtksdaap41>
 <2ae8604d-0da6-4243-1b92-81b3917d7d48@samsung.com>
 <cad52436-b291-05bf-236f-7b7cb1fdbbff@samsung.com>
 <1617195800.18432.3.camel@mtksdaap41>
 <fbb6c44b-eb77-14ce-9175-3f06030e6e0c@samsung.com>
 <cfdd3973-e4a7-8c09-8a7e-57118a7a3b9b@samsung.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_063416_835194_8AFD226D 
X-CRM114-Status: GOOD (  32.47  )
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

On Thu, 2021-04-08 at 11:47 +0900, Chanwoo Choi wrote:
> On 4/1/21 9:16 AM, Chanwoo Choi wrote:
> > On 3/31/21 10:03 PM, andrew-sh.cheng wrote:
> >> On Wed, 2021-03-31 at 17:35 +0900, Chanwoo Choi wrote:
> >>> On 3/31/21 5:27 PM, Chanwoo Choi wrote:
> >>>> Hi,
> >>>>
> >>>> On 3/31/21 5:03 PM, andrew-sh.cheng wrote:
> >>>>> On Thu, 2021-03-25 at 17:14 +0900, Chanwoo Choi wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> You are missing to add these patches to linux-pm mailing list.
> >>>>>> Need to send them to linu-pm ML.
> >>>>>>
> >>>>>> Also, before received this series, I tried to clean-up these patches
> >>>>>> on testing branch[1]. So that I add my comment with my clean-up case.
> >>>>>> [1] https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing-passive-gov__;!!CTRNKA9wMg0ARbw!zIrzeDp9vPnm1_SDzVPuzqdHn3zWie9DnfBXaA-j9-CSrVc6aR9_rJQQiw81_CgAPh9XRRs$ 
> >>>>>>
> >>>>>> And 'Saravana Kannan <skannan@codeaurora.org>' is wrong email address.
> >>>>>> Please update the email or drop this email.
> >>>>>
> >>>>> Hi Chanwoo,
> >>>>>
> >>>>> Thank you for the advices.
> >>>>> I will resend patch v9 (add to linux-pm ML), remove this patch, and note
> >>>>> that my patch set base on
> >>>>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing-passive-gov__;!!CTRNKA9wMg0ARbw!yUlsuxrL5PcbF7o6A9DlCfvoA6w8V8VXKjYIybYyiJg3D0HM-lI2xRuxLUV6b3UJ8WFhg_g$ 
> >>>>
> >>>> I has not yet test this patch[1] on devfreq-testing-passive-gov branch.
> >>>> So that if possible, I'd like you to test your patches with this patch[1] 
> >>>> and then if there is no problem, could you send the next patches with patch[1]?
> >>>>
> >>>> [1]https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/commit/?h=devfreq-testing-passive-gov&id=39c80d11a8f42dd63ecea1e0df595a0ceb83b454__;!!CTRNKA9wMg0ARbw!yUlsuxrL5PcbF7o6A9DlCfvoA6w8V8VXKjYIybYyiJg3D0HM-lI2xRuxLUV6b3UJR2cQqZs$ 
> >>>
> >>>
> >>> Sorry for the confusion. I make the devfreq-testing-passive-gov[1]
> >>> branch based on latest devfreq-next branch.
> >>> [1] https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing-passive-gov__;!!CTRNKA9wMg0ARbw!yUlsuxrL5PcbF7o6A9DlCfvoA6w8V8VXKjYIybYyiJg3D0HM-lI2xRuxLUV6b3UJ8WFhg_g$ 
> >>>
> >>> First of all, if possible, I want to test them[1] with your patches in this series.
> >>> And then if there are no any problem, please let me know. After confirmed from you,
> >>> I'll send the patches of devfreq-testing-passive-gov[1] branch.
> >>> How about that?
> >>>
> >> Hi Chanwoo~
> >>
> >> We will use this on Google Chrome project.
> >> Google Hsin-Yi has test your patch + my patch set v8 [2~8]
> >>
> >>     make sure cci devfreqs runs with cpufreq.
> >>     suspend resume
> >>     speedometer2 benchmark
> >> It is okay.
> >>
> >> Please send the patches of devfreq-testing-passive-gov[1] branch.
> >>
> >> I will send patch v9 base on yours latter.
> > 
> > Thanks for your test. I'll send the patches today.
> 
> I'm sorry for delay because when I tested the patches
> for devfreq parent type on Odroid-xu3, there are some problem
> related to lazy linking of OPP. So I'm trying to analyze them.
> Unfortunately, we need to postpone these patches to next linux
> version.
> 
> 
Hi Chanwoo,
Sorry to bother you.
Do you work on this patch now?
Is there any thing that we can do?


> [snip]
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
