Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B7DEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YW7o4wPjilLbjqfBXgd/So7aRnin3fQJCkqJQL1U7jE=; b=Q7Yi2nSI9PfSRSuLusu6zhIOCt
	9Zh635ONpeUdoIwt7ZeRxPcPaZLvTnqvj4JYce/mvUzpEUrB6JxWlrL2J6MfRb+LC7CDmaHTSinr4
	XOeCuMELvFVFHLLM8+XOWukyb5hQ9r4iakuJQ4WO464JX7PxQ7Fry55WDUsB496CWV6HcnWU/rsta
	CzJTrK+5+aJF05tRDo65OS+GILMBRQ0lMRqDCStuoyyZ79aX5Mls3dchZwNi5HZyzZ8ZSDYXgPn9L
	giyWCH0XpTccOkLz9r0Oq8pdSjljzIO39XXxLQXaxsLks+lsnU5rxUIi0GRyxxMWXDq2178+EoIQw
	aTOCG8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxH5-00F6Kw-34;
	Wed, 05 Jul 2023 07:50:07 +0000
Received: from mail-psaapc01on20731.outbound.protection.outlook.com ([2a01:111:f400:feae::731] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxH2-00F6Iw-1W;
	Wed, 05 Jul 2023 07:50:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoBPPLEGHyPD7j/b/1BTAZ0ezt5Ze6AlrCEV0Aoshvw1czXjCGM08Jnq3kjS47jgQyKY9c6PdEiN713IWiZ9ZYThd0ymdWIkLVk3013HQC3hv1AKj7iCjqr6UhSmroQ0T3AEG1PH83PNDWq3GQhH8ZxLNIPQCKCEN4gJKS+/qJ9FybvX1hFxmtAy6KfPUtCuPlNkwl4cDsVBjJxGgmYlQTwgDiwP1DtHP8Njh5H8P42GgByq9yBgnfUnQG/R9Gb2wu3ObkWZW4sFrivvCNUYqBWQv99fW9QGluxwYzwAHB650BW3gcS1KXSX4fLqQn78gBUcQcKMfFsQLNgP9Iga6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YW7o4wPjilLbjqfBXgd/So7aRnin3fQJCkqJQL1U7jE=;
 b=RmT0bm8gnAJ/ObzlPJ+7rnCMGfUP0Rxomcvhp2LtZwF84ZpePMcD8Le7hVlEmZ+doT0NcuYhhhLOVqfcb4ptcISp6gpM80aKZ7JZJVp3TRDRyQJB0G7/xx6JA1/nlYac8LQ59QYinmpd5IBVpkX5Ttovl8CjNp9YrykXapshS+omrk+euTdSjHxK9OzmGI9zgZw2VeykGt5CAeqNYfnmXLuHPUDaFMwKNRjg5Irh2Q69K7yiNjYKXjeK4u+zuPPpDJaPIDrgx+M42sPBcNyWielPnc3dn7Dh0SkFc8TTzXdpikNLxaPs2ZvoUWrL0iPHT/XdKyBHzLkTdF65Ep8M5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YW7o4wPjilLbjqfBXgd/So7aRnin3fQJCkqJQL1U7jE=;
 b=koaFBlUg10UwVlglgfKDzP6p97Qc/6EcjnMzUeyqvI65+KXFtfv5Dh7BP+zX1Xxe+XJGmyc8YYaZKUMJ2602ZB+Ctuysl033YD3zOXOpAW//gL3J4JCGEkiU/pjQFPPLLUOCX6zISBVlDYnX+LBrYATT1P4nCwgUYv8nQTZwTut3c4L08rdNymvPeO2pivlUT57bb+IVGDNDarHJL922nSVftOiRU99fbiUXlUsh1cGI+5we+J33DvJ3bN5cqrMGE6i/1PyWXWYPQcyUrlQdFFj0y025d9GWhRb0cyNdHvV/5IfHekq0f45SSHRBctgWJ5zVbtTncHoHNZeYamvq3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6663.apcprd06.prod.outlook.com (2603:1096:101:175::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 07:49:56 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 07:49:55 +0000
From: Yangtao Li <frank.li@vivo.com>
To: frank.li@vivo.com
Cc: Jonathan.Cameron@Huawei.com,
	amitk@kernel.org,
	angelogioacchino.delregno@collabora.com,
	bchihi@baylibre.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel.lezcano@linaro.org,
	florian.fainelli@broadcom.com,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	matthias.bgg@gmail.com,
	miquel.raynal@bootlin.com,
	mmayer@broadcom.com,
	rafael@kernel.org,
	rui.zhang@intel.com,
	tglx@linutronix.de,
	u.kleine-koenig@pengutronix.de,
	wenst@chromium.org
Subject: Re: [PATCH v3 1/5] genirq/devres: Add devm_request_threaded_irq_emsg()
Date: Wed,  5 Jul 2023 15:49:45 +0800
Message-Id: <20230705074945.3687-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <c092b860-33d5-77c0-456c-367d545e8b7f@vivo.com>
References: <c092b860-33d5-77c0-456c-367d545e8b7f@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb82285-6094-4503-5231-08db7d2c6c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CfIE73a8OEPHbfGRaxEYM3qolT07EH695kuf+Y4InodSH9s3rPLEFlbGpqthH7UjgYiwel3SeoinXgZ/H32xBkgNfYyROdrfdLlz5e+oJ7xYt4Ml0yVATKKrt2bF0BTR5o8jtw8bhocwjw1aXNRbCKGVhF0nE+PdHoOdY0tUjP4Mn0LEecxZvn94iWWb3odU6yRGSxm/vg6W/8WFcId4mrJsmRay/yvZiOpssXTD8PPQ5SE0dOseXmaRfNWQga2uD5dUAXTQlqBgAmprQ7FAmZV1vAeLLkh0Azxu0SyW49saySfvHUNLQmEIXIG7uWBFCON6F5/h5JaEXfMkkmooRrgQU0ziQ/bYC6ED1k1PgI++HIriR40x5T9Gf/TQoRpnmAVie6FA2tF2rnJg7EuW1wY7r803Q8743jcvG+Q5+d5rFQ5InI69mHffhJuR4xfvLzLhHtvWVTi1mZwqXanl2OVLxuDQ0y1GVdBXW/DfcNQ+VSP06xFlGQP7z0z8aptzFGB2TdstugptuDcoOz9pdaDq2eo7B9/zvK9kvv+7t3UDBjAEFxKYj11ESDfYA1no+aatMQbcPqbnS6KOp4TYzhY3hi7M0+tJOFUYgs0Dn/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199021)(7416002)(34206002)(66556008)(478600001)(36756003)(66476007)(66946007)(8936002)(4326008)(8676002)(2906002)(5660300002)(316002)(41300700001)(37006003)(6512007)(86362001)(52116002)(38350700002)(38100700002)(4744005)(6666004)(6486002)(26005)(1076003)(186003)(6506007)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bubtkPL9nxvts9xnHhAkvnt4NWW19rGkfpoHmS0FQ8USqTfyXoqxyW0OiWNP?=
 =?us-ascii?Q?djl5zbdBvyoOyYC6X3zlf7CHnTQJ8/YulLgW0EV4gerMP8SBQPq3MjXRBTs0?=
 =?us-ascii?Q?KoOAqYvGngdsoIkr8liLVc242nTDA56DR1UV1qKkeksoFGMVWJAslq4I+WDZ?=
 =?us-ascii?Q?yImwgeFni1C0KJyGyc+VQGFwpGIsl185aHyqyicF7JjELzXguBNAwwyTtkB9?=
 =?us-ascii?Q?91xR9jb3TGJSvRhPbvyWpvz278ioQv5yPPJ/omRCziTHor97PszatDIIgFwl?=
 =?us-ascii?Q?wUreH0wLVpDQ7XLGDmFj3BPm50CPVPQKHRKnelDGvuvQgh6F5+/YnYQlscvM?=
 =?us-ascii?Q?7pOgUiZ2e8HahgCyP5jAdrYZHd43PFK+iaValIRsAVzfGE+Fwua6H0un5Qob?=
 =?us-ascii?Q?+V/FfydRTRWy5F1T/871g898Q4pyt7h37HxseLh+m6xUZSXM4Iu8cX8p4/Di?=
 =?us-ascii?Q?dNmrJqZ6kNDo1ntT5mfBaPRVRJncqN6DKQG8IVWmJb/mnEGaiHVrICUD+9A4?=
 =?us-ascii?Q?emZrUP90xwJYvCGgCaSFTkPJ0zr0ZeDQlez+KErdkwcLpnJh+PFbXFXaWRBP?=
 =?us-ascii?Q?CJkjl1aE9Zfy/QnUqjHaJmXd2mHajPDHrBh2LXVdUidIiB4BMvRz2fNLnzZo?=
 =?us-ascii?Q?ilU67qVQ61kmWA/vBf3rVDzYXYgGjwW2kEmABwBko2MpkmND9TniFWGQ2+99?=
 =?us-ascii?Q?XDejKvBW/LGB45gXxIobiE57ZpfgJaMrqK1YxJgWCL7nUNjI3W6tMSKeJdBh?=
 =?us-ascii?Q?xBIEUakecrYBhV510clc26Ka/+glH2SsSU0sq0feoYC8Vqhu9RUWh/h6Yhrm?=
 =?us-ascii?Q?HtQ2zirH8xna7ysXW4htVh0WO+bsxuocdH47U8VWo9pB51dH2xB2gkBu4/RV?=
 =?us-ascii?Q?iYrkZplZdlkgNGrKBircHtPggcGaa1S226E72QzQkdPdb2ehbMiOay/ol46L?=
 =?us-ascii?Q?0Ch2cB0hX/w8Ua4aPKQUmBs886n2gQiSv2WP+VRQO6M9p7V0DXeYQY0m4bIs?=
 =?us-ascii?Q?kmN/pGKfjXdkO9uv2memZKdorsmhP4ldkW+w76EWAJRJP40tBNovrR/X/hfV?=
 =?us-ascii?Q?8z/5EZ0dxAByqewaQYc9N8gDExbe/NN7RxeoU2W4ktEE/ZCqjI0+qMdJ5Hvn?=
 =?us-ascii?Q?3wnJWjpzZKLWCoq8KI4OLvTZP0eV3q90phb2qnpMEKt3v8sCK8cO56e6X0RQ?=
 =?us-ascii?Q?4/Ywe/WUM4xBEFor4be9IJtXLUajwi6qmEHDmV9ktvLTqF62Qhsh0Hzyo0Vk?=
 =?us-ascii?Q?x1vCgrBatTRRRoiGFT9asqeDF/FMpXHeGsMCCGuZ+VfTNnx2SiERrFjRlT9X?=
 =?us-ascii?Q?YhHAIBtECievszLtRM0WQtQIQxgmAfC0rMrxmIzZHPU8HqTZdIBXn6xGAJB4?=
 =?us-ascii?Q?OxamzYiVyD0mVbG5w80HHxuEQmHfTkk35ARPWBemJdBYTUBrR18d9amfDPg8?=
 =?us-ascii?Q?/E/SBSLQBGK2ZApyIPVNGsR5EpdJapDdlLCZCCRTlyiYlOqjyrJISzUBrlKH?=
 =?us-ascii?Q?N52WHQLc2Pn5bardyun3avdSwkpZ4OEUfGNYj2TjbVdeRohM2I2fOpyfm5Pi?=
 =?us-ascii?Q?zR3g7JMOrxbIoknkVTw0DfMRfy4F2FqkLLllCaAX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb82285-6094-4503-5231-08db7d2c6c95
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 07:49:55.9110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJdlN08zLjgLnxXfBM0Jj+aAvH5Nkf+PiVM5A306TCzPrXS24gVgZSkLrfbHRQgyHZyRRwwlvxjPJO4xAt004g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_005004_519869_3AC747A5 
X-CRM114-Status: UNSURE (   5.22  )
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

I don't know what's wrong with the email client that caused the line break to be abnormal.
I used git send-email to resend this.

int devm_request_threaded_irq_probe(struct device *dev, unsigned int irq,
				    irq_handler_t handler, irq_handler_t thread_fn,
				    unsigned long irqflags, const char *devname,
				    void *dev_id, const char *info) 
{
	int rc;

	rc = devm_request_threaded_irq(dev, irq, handler, NULL, irqflags, devname, dev_id);
	if (rc)
		return dev_err_probe(dev, rc, "Failed to request %sinterrupt %u %s %s\n",
				     thread_fn ? "threaded " : "", irq, devname ? : dev_name(dev),
				     info ? : "");
	return 0; 
}
EXPORT_SYMBOL(devm_request_threaded_irq_probe);

Thx,
Yangtao

