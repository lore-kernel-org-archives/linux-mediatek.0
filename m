Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A4CCCF9EB
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 07:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJFfYykRlBHOdi5XlphjJ7Of6rfFrNXO8UImzwMboPo=; b=RTmDuPCZocfE9lb2TYO6ywtGxy
	SVjOePYYVx6BgRwQF8vtCrWl5b1coYdV2RQxnmKeXEcClw1rqe2CMWUYgyXNaTNYCzQRJhdh7+joG
	ek/KY7R2IDEhKwiacH4g2IyWSBnZRa8hPf0RyU0YsnjVoWsSPmo1PPnLfjSU9a++Kxjc84Ze6pIPj
	fW8JSmnR0R0+MHd/Q46vsMQDOn4ihXQsmfndi/D24xxKCicvGmkOZaYH/43cVCJmpRg/OFWP0g9oP
	CpHQVlVRX/SGoRjrg0ln39s+FwmvZqSiYV7rLkB/fARFE03ktj/nwSqel2VN9Scxeje3WKb5xuWFw
	cRiaw7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHHy-0000000DFYM-1cmj;
	Mon, 27 Oct 2025 07:05:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHHv-0000000DFXR-2sYq
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Oct 2025 07:05:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-427084a641aso3075981f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Oct 2025 00:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761548706; x=1762153506; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJFfYykRlBHOdi5XlphjJ7Of6rfFrNXO8UImzwMboPo=;
        b=yT/gtb9QZebZGBbhibQ/UJNQMpapm8NNStTMG9IeqMXpgBXgf+yYj8nJPBErIypGCY
         cK2D1UgC0UB87V5n7HwVCzcU8+ORLqOE3ZzNvZW5L8KkrKfGyNGFncMuPw2CrqWVegdc
         he5aPFKUMRNXgosqSXVGP8gE8AQW8F3jnubOX+JEH9CiR0/ohD1nLm13RBAV/+bmikSN
         JID1fnWTXLhna+OB/tbVMaMEuXI8AO9pBm8mcwMuT1y889rUl/LvOOlveHXlEH9Mfs27
         JBiy6cABp0TlkeEBxfxKs2dnN7OB5mcJjQJMD++WhPTYAYBbsw3UGK3wPLU+nKI4iL5v
         ZBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761548706; x=1762153506;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJFfYykRlBHOdi5XlphjJ7Of6rfFrNXO8UImzwMboPo=;
        b=twFtJQpdlXizM7ArzrGuOjGD0j9p67PQxeA6brKYgn7bwd8oed/P8VjrqtSdxD+Vop
         YTeW1V7h7ObgYhojaaxNNpDgNVU5d7julDCAbemp4on5SNgMt6BUqnjZmZ20GCs1Yg6T
         6DQbh1yufceAtH+SotFnJ7MavPyMkuj0i7Uhv4npcrx7RvnTnKnazJrEdRBT50+U868K
         9Msu8rBB0J6O4XeMnPsMCjHArQv3Na0CG/KxShCbyutvQ/Kb2zA4gSPio7li6CUncexM
         2oOsGM9ntN4qpHgcdHFSSrN6OAAVYybHWNkE6oPy6ARJvPnf1+YceFf8C8BULu8JDXF1
         UlBw==
X-Forwarded-Encrypted: i=1; AJvYcCVh41KS4ZfKbOivAwv4lqxgB0tkekG7N2BP6ECNarlp5O3s+TNQFkjsV+aAJIMUlFx507KqtqKsXG3dFUztjA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2ecipH1mBVb9w/kQfOx0jQQmc4UfGoDUNaHUgKWzJrhSs4a+H
	3Khqc1ud7qwgmKVhKNsS8CE30L9ZreNXTBWomaRH4RTjDCMVTE77Oo4/zcJwSrL0yqE=
X-Gm-Gg: ASbGncsPUbh3sNnckr49yJMfLn6TMJ9IlJulvRI/508yoQQ0+LkWqElF6m4YkpclwOH
	IFENfzVWf3s6BnVv2tSb6ar+sC1CIBTXzvrkvXFhaAdRReNKM/IFvWkr+eBd+Jqhvx9GHINgwUz
	nIirSwiW/3ADwE2Xgt4/q2Wr6jvBDZrmk6MRJiwV0KIiVm3XW/W8t8RyXVyFdm4iSgwTCFEKJfK
	LzTuHxe0fJSZWlsQeh8nGT5szSlO8efGg5xcm8q5YI1WLJH2KPznaRCkd70llVi2XdRYnVFfcZ8
	bfP2K+nSFSnfjHDQG7mbXv7wKMC3hJ39G57r3y7J9j95vNgGiOX8FYzXmLCDJqTByC0PfKsPiH8
	VNBwouEs4XfYA22XIvRqI7OkE1Jis2pQFFE+u6uUTfQa8BrYcjF5rwVowC27RXswWoR5cEDqQEk
	lOoJP1Tw==
X-Google-Smtp-Source: AGHT+IHDnxuF6aY8pbvXwwIn4O7yBK8Zhk1QQ4A/6lD/VCtErpeSNtvVwKJ1RrIizvoFYs0suVFpwg==
X-Received: by 2002:a5d:64c4:0:b0:426:d51c:4d71 with SMTP id ffacd0b85a97d-42704d44253mr22554112f8f.8.1761548705515;
        Mon, 27 Oct 2025 00:05:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952d9e80sm12345048f8f.28.2025.10.27.00.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 00:05:05 -0700 (PDT)
Date: Mon, 27 Oct 2025 10:05:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] pmdomain: mediatek: Add support for MT8196 SCPSYS power
 domains
Message-ID: <aP8ZneXa5pcsb_9N@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_000507_779362_5A108E03 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello AngeloGioacchino Del Regno,

Commit ead9cf65d50f ("pmdomain: mediatek: Add support for MT8196
SCPSYS power domains") from Sep 25, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/pmdomain/mediatek/mtk-pm-domains.c:865 scpsys_add_one_domain()
	error: we previously assumed 'pd->data' could be null (see line 840)

drivers/pmdomain/mediatek/mtk-pm-domains.c
    718 static struct
    719 generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node)
    720 {
    721         const struct scpsys_domain_data *domain_data;
    722         const struct scpsys_hwv_domain_data *hwv_domain_data;
    723         struct scpsys_domain *pd;
    724         struct property *prop;
    725         const char *clk_name;
    726         int i, ret, num_clks;
    727         struct clk *clk;
    728         int clk_ind = 0;
    729         u32 id;
    730 
    731         ret = of_property_read_u32(node, "reg", &id);
    732         if (ret) {
    733                 dev_err(scpsys->dev, "%pOF: failed to retrieve domain id from reg: %d\n",
    734                         node, ret);
    735                 return ERR_PTR(-EINVAL);
    736         }
    737 
    738         switch (scpsys->soc_data->type) {
    739         case SCPSYS_MTCMOS_TYPE_DIRECT_CTL:
    740                 if (id >= scpsys->soc_data->num_domains) {
    741                         dev_err(scpsys->dev, "%pOF: invalid domain id %d\n", node, id);
    742                         return ERR_PTR(-EINVAL);
    743                 }
    744 
    745                 domain_data = &scpsys->soc_data->domains_data[id];
    746                 hwv_domain_data = NULL;
    747 
    748                 if (domain_data->sta_mask == 0) {
    749                         dev_err(scpsys->dev, "%pOF: undefined domain id %d\n", node, id);
    750                         return ERR_PTR(-EINVAL);
    751                 }
    752 
    753                 break;
    754         case SCPSYS_MTCMOS_TYPE_HW_VOTER:
    755                 if (id >= scpsys->soc_data->num_hwv_domains) {
    756                         dev_err(scpsys->dev, "%pOF: invalid HWV domain id %d\n", node, id);
    757                         return ERR_PTR(-EINVAL);
    758                 }
    759 
    760                 domain_data = NULL;

NULL here.

    761                 hwv_domain_data = &scpsys->soc_data->hwv_domains_data[id];
    762 
    763                 break;
    764         default:
    765                 return ERR_PTR(-EINVAL);
    766         }
    767 
    768         pd = devm_kzalloc(scpsys->dev, sizeof(*pd), GFP_KERNEL);
    769         if (!pd)
    770                 return ERR_PTR(-ENOMEM);
    771 
    772         pd->data = domain_data;
                ^^^^^^^^^^^^^^^^^^^^^^

    773         pd->hwv_data = hwv_domain_data;
    774         pd->scpsys = scpsys;
    775 
    776         if (MTK_SCPD_CAPS(pd, MTK_SCPD_DOMAIN_SUPPLY)) {
    777                 pd->supply = devm_of_regulator_get_optional(scpsys->dev, node, "domain");
    778                 if (IS_ERR(pd->supply))
    779                         return dev_err_cast_probe(scpsys->dev, pd->supply,
    780                                       "%pOF: failed to get power supply.\n",
    781                                       node);
    782         }
    783 
    784         num_clks = of_clk_get_parent_count(node);
    785         if (num_clks > 0) {
    786                 /* Calculate number of subsys_clks */
    787                 of_property_for_each_string(node, "clock-names", prop, clk_name) {
    788                         char *subsys;
    789 
    790                         subsys = strchr(clk_name, '-');
    791                         if (subsys)
    792                                 pd->num_subsys_clks++;
    793                         else
    794                                 pd->num_clks++;
    795                 }
    796 
    797                 pd->clks = devm_kcalloc(scpsys->dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
    798                 if (!pd->clks)
    799                         return ERR_PTR(-ENOMEM);
    800 
    801                 pd->subsys_clks = devm_kcalloc(scpsys->dev, pd->num_subsys_clks,
    802                                                sizeof(*pd->subsys_clks), GFP_KERNEL);
    803                 if (!pd->subsys_clks)
    804                         return ERR_PTR(-ENOMEM);
    805 
    806         }
    807 
    808         for (i = 0; i < pd->num_clks; i++) {
    809                 clk = of_clk_get(node, i);
    810                 if (IS_ERR(clk)) {
    811                         ret = PTR_ERR(clk);
    812                         dev_err_probe(scpsys->dev, ret,
    813                                       "%pOF: failed to get clk at index %d\n", node, i);
    814                         goto err_put_clocks;
    815                 }
    816 
    817                 pd->clks[clk_ind++].clk = clk;
    818         }
    819 
    820         for (i = 0; i < pd->num_subsys_clks; i++) {
    821                 clk = of_clk_get(node, i + clk_ind);
    822                 if (IS_ERR(clk)) {
    823                         ret = PTR_ERR(clk);
    824                         dev_err_probe(scpsys->dev, ret,
    825                                       "%pOF: failed to get clk at index %d\n", node,
    826                                       i + clk_ind);
    827                         goto err_put_subsys_clocks;
    828                 }
    829 
    830                 pd->subsys_clks[i].clk = clk;
    831         }
    832 
    833         if (scpsys->domains[id]) {
    834                 ret = -EINVAL;
    835                 dev_err(scpsys->dev,
    836                         "power domain with id %d already exists, check your device-tree\n", id);
    837                 goto err_put_subsys_clocks;
    838         }
    839 
    840         if (pd->data && pd->data->name)
                    ^^^^^^^^
Check for NULL

    841                 pd->genpd.name = pd->data->name;
    842         else if (pd->hwv_data && pd->hwv_data->name)
    843                 pd->genpd.name = pd->hwv_data->name;
    844         else
    845                 pd->genpd.name = node->name;
    846 
    847         if (scpsys->soc_data->type == SCPSYS_MTCMOS_TYPE_DIRECT_CTL) {
    848                 pd->genpd.power_off = scpsys_power_off;
    849                 pd->genpd.power_on = scpsys_power_on;
    850         } else {
    851                 pd->genpd.power_off = scpsys_hwv_power_off;
    852                 pd->genpd.power_on = scpsys_hwv_power_on;
    853 
    854                 /* HW-Voter code can be invoked in atomic context */
    855                 pd->genpd.flags |= GENPD_FLAG_IRQ_SAFE;
    856         }
    857 
    858         /*
    859          * Initially turn on all domains to make the domains usable
    860          * with !CONFIG_PM and to get the hardware in sync with the
    861          * software.  The unused domains will be switched off during
    862          * late_init time.
    863          */
    864         if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
--> 865                 if (scpsys_domain_is_on(pd))
                                                ^^
The patch adds an unchecked dereference of pd->data in the
scpsys_domain_is_on() function.


    866                         dev_warn(scpsys->dev,
    867                                  "%pOF: A default off power domain has been ON\n", node);
    868         } else {
    869                 ret = pd->genpd.power_on(&pd->genpd);
    870                 if (ret < 0) {
    871                         dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
    872                         goto err_put_subsys_clocks;
    873                 }
    874 
    875                 if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
    876                         pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
    877         }
    878 

regards,
dan carpenter

