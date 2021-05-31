Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFFBC47093
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 03:23:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0208C61186
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 03:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0208C61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3IGaCcKOVel4Am9Sau2lgS08KdYI+oovB5raPJNfvI=; b=1CUdwtSzsnueoL
	EofBzoFscRar77yWmEQxZaiDyrIqPzfJuyZ7QVvWxO+81FEDzKSxMcEx+A5AeSC66kV62jkota593
	lKwpQSBJltSfVnGJtL+M4TMeuDJbvGfi0KnYugV2H7a5KIHMAihZ1Mq7ikil4b9B1vUh9fnmhBMjT
	f/Ms5XE3d1RWj7H+wVaa2XNkLXatxuoYOZfqUFFZwA9Hj1l+87G9R1w77hLVmh9MAZq9AdYnARXQR
	qiXviskLDKjtYwHaiqW/bOci6Dql2hK+MQOTmaQwFQoSJB9Vsv1cX6z3IvivscpzW/NkaMCAxg+Rk
	2ynvOf/RableEEtlxC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnYWL-00AZyq-V3; Mon, 31 May 2021 03:23:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnYW8-00AZxO-Mo; Mon, 31 May 2021 03:23:06 +0000
X-UUID: 8ab77a1a93774c7082aa70b3ec67983d-20210530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=f67WQhmb+df3I9kPJMGHkjRiDrgZqd9/FKeodOjihUg=; 
 b=pUVekmk9GrMcMLiICeDukQeS1+zgPrlk24rn4e8tHd4iF788zOisCWe5Z+yTt859onvO2bZoLDFMStx5C9lZ9O34wZSw1k1fBdLWhrgzryhDcua/edfmKmFuwxIbmLl3l5pAO1vqkKh7YVC15FW2TLe6h25Rpkvn3vcscimTowM=;
X-UUID: 8ab77a1a93774c7082aa70b3ec67983d-20210530
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1992632562; Sun, 30 May 2021 20:22:59 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 30 May 2021 20:22:57 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 11:22:56 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 31 May 2021 11:22:56 +0800
Message-ID: <1622431376.14423.5.camel@mtksdaap41>
Subject: Re: [PATCH V8 1/8] PM / devfreq: Add cpu based scaling support to
 passive_governor
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, Hsin-Yi Wang <hsinyi@google.com>
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
Date: Mon, 31 May 2021 11:22:56 +0800
In-Reply-To: <dd58c29a-35b1-b853-bc4a-3225b21b082a@samsung.com>
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
 <1621995727.29827.1.camel@mtksdaap41>
 <dd58c29a-35b1-b853-bc4a-3225b21b082a@samsung.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_202304_780565_BC340A25 
X-CRM114-Status: GOOD (  41.56  )
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

On Wed, 2021-05-26 at 12:08 +0900, Chanwoo Choi wrote:
> Hi,
> On 5/26/21 11:22 AM, andrew-sh.cheng wrote:
> > On Thu, 2021-04-08 at 11:47 +0900, Chanwoo Choi wrote:
> >> On 4/1/21 9:16 AM, Chanwoo Choi wrote:
> >>> On 3/31/21 10:03 PM, andrew-sh.cheng wrote:
> >>>> On Wed, 2021-03-31 at 17:35 +0900, Chanwoo Choi wrote:
> >>>>> On 3/31/21 5:27 PM, Chanwoo Choi wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 3/31/21 5:03 PM, andrew-sh.cheng wrote:
> >>>>>>> On Thu, 2021-03-25 at 17:14 +0900, Chanwoo Choi wrote:
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> You are missing to add these patches to linux-pm mailing list.
> >>>>>>>> Need to send them to linu-pm ML.
> >>>>>>>>
> >>>>>>>> Also, before received this series, I tried to clean-up these patches
> >>>>>>>> on testing branch[1]. So that I add my comment with my clean-up case.
> >>>>>>>> [1] https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing-passive-gov__;!!CTRNKA9wMg0ARbw!zIrzeDp9vPnm1_SDzVPuzqdHn3zWie9DnfBXaA-j9-CSrVc6aR9_rJQQiw81_CgAPh9XRRs$ 
> >>>>>>>>
> >>>>>>>> And 'Saravana Kannan <skannan@codeaurora.org>' is wrong email address.
> >>>>>>>> Please update the email or drop this email.
> >>>>>>>
> >>>>>>> Hi Chanwoo,
> >>>>>>>
> >>>>>>> Thank you for the advices.
> >>>>>>> I will resend patch v9 (add to linux-pm ML), remove this patch, and note
> >>>>>>> that my patch set base on
> >>>>>>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing-passive-gov__;!!CTRNKA9wMg0ARbw!yUlsuxrL5PcbF7o6A9DlCfvoA6w8V8VXKjYIybYyiJg3D0HM-lI2xRuxLUV6b3UJ8WFhg_g$ 
> >>>>>>
> >>>>>> I has not yet test this patch[1] on devfreq-testing-passive-gov branch.
> >>>>>> So that if possible, I'd like you to test your patches with this patch[1] 
> >>>>>> and then if there is no problem, could you send the next patches with patch[1]?
> >>>>>>
> >>>>>> [1]https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/commit/?h=devfreq-testing-passive-gov&id=39c80d11a8f42dd63ecea1e0df595a0ceb83b454__;!!CTRNKA9wMg0ARbw!yUlsuxrL5PcbF7o6A9DlCfvoA6w8V8VXKjYIybYyiJg3D0HM-lI2xRuxLUV6b3UJR2cQqZs$ 
> >>>>>
> >>>>>
> >>>>> Sorry for the confusion. I make the devfreq-testing-passive-gov[1]
> >>>>> branch based on latest devfreq-next branch.
> >>>>> [1] https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing-passive-gov__;!!CTRNKA9wMg0ARbw!yUlsuxrL5PcbF7o6A9DlCfvoA6w8V8VXKjYIybYyiJg3D0HM-lI2xRuxLUV6b3UJ8WFhg_g$ 
> >>>>>
> >>>>> First of all, if possible, I want to test them[1] with your patches in this series.
> >>>>> And then if there are no any problem, please let me know. After confirmed from you,
> >>>>> I'll send the patches of devfreq-testing-passive-gov[1] branch.
> >>>>> How about that?
> >>>>>
> >>>> Hi Chanwoo~
> >>>>
> >>>> We will use this on Google Chrome project.
> >>>> Google Hsin-Yi has test your patch + my patch set v8 [2~8]
> >>>>
> >>>>     make sure cci devfreqs runs with cpufreq.
> >>>>     suspend resume
> >>>>     speedometer2 benchmark
> >>>> It is okay.
> >>>>
> >>>> Please send the patches of devfreq-testing-passive-gov[1] branch.
> >>>>
> >>>> I will send patch v9 base on yours latter.
> >>>
> >>> Thanks for your test. I'll send the patches today.
> >>
> >> I'm sorry for delay because when I tested the patches
> >> for devfreq parent type on Odroid-xu3, there are some problem
> >> related to lazy linking of OPP. So I'm trying to analyze them.
> >> Unfortunately, we need to postpone these patches to next linux
> >> version.
> >>
> > Hi Chanwoo Choi~
> > 
> > It is said that you are busy on another task recently.
> > May I know your plan on this patch?
> > Thank you.
> 
> Sorry for late work. I have a question.
> When I tested exynos-bus.c with adding the 'required-opp' property
> on odroid-xu3 board. I got some fail about 
> 
> When calling _set_required_opps(), always _set_required_opp() returns
> -EBUSY error because of following lazy linking case[1].
> 
> [1] https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.13-rc3/source/drivers/opp/core.c*L896__;Iw!!CTRNKA9wMg0ARbw!3eNxwDZRy-Ev5BHGxT-BxCz4qrNy0NZohQuBGW36krkwOkl_WX8yBmxlqSk9hxp_kxspMJI$ 
> 
> /* required-opps not fully initialized yet */
> if (lazy_linking_pending(opp_table))
> 	return -EBUSY;  
> 
> 
> For calling dev_pm_opp_of_add_table(), lazy_link_required_opp_table() function
> will be called. But, there is constraint[2]. If is_genpd of opp_table is false,
> driver/opp/of.c cannot resolve the lazy linking issue.
> 
> [2]  https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.13-rc3/source/drivers/opp/of.c*L386__;Iw!!CTRNKA9wMg0ARbw!3eNxwDZRy-Ev5BHGxT-BxCz4qrNy0NZohQuBGW36krkwOkl_WX8yBmxlqSk9hxp_QFUVY9E$ 
> 
> /* Link required OPPs for all OPPs of the newly added OPP table */
> static void lazy_link_required_opp_table(struct opp_table *new_table)
> {
> 	struct opp_table *opp_table, *temp, **required_opp_tables;
> 	struct device_node *required_np, *opp_np, *required_table_np;
> 	struct dev_pm_opp *opp;
> 	int i, ret;
> 
> 	/*
> 	 * We only support genpd's OPPs in the "required-opps" for now,
> 	 * as we don't know much about other cases.
> 	 */
> 	if (!new_table->is_genpd)
> 		return;
> 
> Even if this case, there are no problem on your test case?
> 

Hi Chanwoo~
Sorry for late reply.
Yes, we meet similar issue.
Google member Hsin-Yi had helped deal with this issue on Chrome project.

Patch segment:
@ /drivers/opp/of.c

/* Link required OPPs for all OPPs of the newly added OPP table */
static void lazy_link_required_opp_table(struct opp_table *new_table)
{
	struct opp_table *opp_table, *temp, **required_opp_tables;
	struct device_node *required_np, *opp_np, *required_table_np;
	struct dev_pm_opp *opp;
	int i, ret;

+	/*
+	 * We only support genpd's OPPs in the "required-opps" for now,
+	 * as we don't know much about other cases.
+	 */
+	if (!new_table->is_genpd)
+		return;


Hsin-Yi replied this issue in the discussion list in the original lazy
link thread:
https://patchwork.kernel.org/project/linux-pm/patch/20190717222340.137578-4-saravanak@google.com/#23932203

Loop Hsin-YI here.
You can discuss with her if needing more detail.

Thank you both.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
