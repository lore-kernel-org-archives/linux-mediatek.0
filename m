From: Carlos Hernandez <ceh@ti.com>
Subject: Re: [PATCH 04/13] thermal: Fix not emulating critical temperatures
Date: Thu, 26 Mar 2015 14:13:47 -0400
Message-ID: <55144C5B.7070208@ti.com>
References: <1427385240-6086-1-git-send-email-s.hauer@pengutronix.de> <1427385240-6086-5-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1427385240-6086-5-git-send-email-s.hauer@pengutronix.de>
Sender: linux-pm-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Mikko Perttunen <mikko.perttunen@kapsi.fi>, kernel@pengutronix.de, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 03/26/2015 11:53 AM, Sascha Hauer wrote:
> - The code should only accept an emulated temperature when the emulated
>    temperature is lower than the critical temperature. Instead the code

Why?
Emulating temperatures higher than critical temperature is useful for 
testing. For instance it allows one to validate that critical action 
(i.e. shutdown) is triggered.



